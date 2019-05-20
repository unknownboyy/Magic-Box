var Router= require('koa-router');
var bodyParser = require('koa-body')();

module.exports = function(app){

    var router = new Router();

    //Welcome Routes
    var welcomeCtrl = require('./../controllers/WelcomeCtrl');
    router.get('/', welcomeCtrl.showHomePage);
    router.get('/signup',welcomeCtrl.showSignup);
    router.post('/signup',welcomeCtrl.signup);
    router.get('/login',welcomeCtrl.showLogin);
    router.get('/dashboard',welcomeCtrl.showDash);
    router.post('/login',welcomeCtrl.login);
    router.get('/logout',welcomeCtrl.logout);
    router.get('/addque',welcomeCtrl.addque);
    router.post('/addque',welcomeCtrl.newque);
    router.post('/addmod',welcomeCtrl.addmod);
    router.post('/quiz',welcomeCtrl.quiz);
    router.get('/scoreboard',welcomeCtrl.scoreboard);
    router.post('/getQuestions',welcomeCtrl.getQuestions);
    router.post('/submitTest',welcomeCtrl.submitTest);

    return router.middleware();
}
