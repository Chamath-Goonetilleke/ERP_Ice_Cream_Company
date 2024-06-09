package com.AdwinsCom.AdwinsCom.controller;
import com.AdwinsCom.AdwinsCom.dao.PrivilegeDao;
import com.AdwinsCom.AdwinsCom.entity.Privilege;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping(value = "/privilege")
public class PrivilegeController {

    @Autowired
    private PrivilegeDao privilegeDao;


    //Get mapping for generate privilegeUI
    @GetMapping
    public ModelAndView privilegeUi() {
        //Get authenticated logged user authentication  object using security contest
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        ModelAndView privilegeUi = new ModelAndView();
        privilegeUi.addObject("loginusername",auth.getName());
        privilegeUi.addObject("title","Employee Management : Privilege Management");
        privilegeUi.setViewName("privilege.html");

        return privilegeUi;
    }

    //URL -> privilege/findall
    @GetMapping(value = "/findall", produces = "application/json")
    public List<Privilege> findAll() {

        return privilegeDao.findAll(Sort.by(Sort.Direction.DESC,"id"));
    }

    public HashMap<String, Boolean> getPrivilegeByUserModule(String username , String modulename) {
        HashMap<String, Boolean> userPrivilege = new HashMap<String, Boolean>();
        if (username.equals("Admin")){
            userPrivilege.put("insert",true);
            userPrivilege.put("select",true);
            userPrivilege.put("update",true);
            userPrivilege.put("delete",true);
        } else{
            String userPrivi  = privilegeDao.getPrivilageByUserModule(username, modulename);
            // 1,1,1,0
            String[] userPrivilist = userPrivi.split(",");
            userPrivilege.put("select", userPrivilist[0].equals("1"));
            userPrivilege.put("insert", userPrivilist[1].equals("1"));
            userPrivilege.put("update", userPrivilist[2].equals("1"));
            userPrivilege.put("delete", userPrivilist[3].equals("1"));
        }
        return userPrivilege;
    }

    // Create GetMapping for get privilege by logged user
    @GetMapping(value = "/byloggedusermodule/{modulename}" ,produces="application/json")
    public HashMap<String,Boolean> getPrivilegeByLoggedUserModule(@PathVariable("modulename") String modulename){

        //Get Logged User by Authentication object
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return getPrivilegeByUserModule(auth.getName(),modulename);

    };


}
