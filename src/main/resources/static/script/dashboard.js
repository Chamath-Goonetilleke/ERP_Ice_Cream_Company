const btnSingOut = () =>{
    let userConfirm = confirm("Are you sure to sign out...?");
    if(userConfirm){
        window.location.assign("/logout");
    }
}