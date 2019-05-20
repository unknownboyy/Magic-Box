var sessionUtils = require('../utils/sessionUtils');
var util = require('util');
var databaseUtils = require('../utils/databaseUtils');


module.exports = {

    showHomePage: function* (next) {
        yield this.render('home',{

        });
    },

    showSignup:function*(next){
        var courses = yield databaseUtils.executeQuery(util.format('select * from course'));
        var branch = yield databaseUtils.executeQuery(util.format('select * from branch'));
        yield this.render("signup",{courses:courses,branch:branch});
    },

    logout: function* (next) {
        var sessionId = this.cookies.get("SESSION_ID");
        if(sessionId) {
            sessionUtils.deleteSession(sessionId);
        }
        this.cookies.set("SESSION_ID", '', {expires: new Date(1), path: '/'});

        this.redirect('/');
    },
    signup:function *(next) {
        var email = this.request.body.email;
        var password = this.request.body.password;
        var year = this.request.body.year;
        var course = this.request.body.course;
        var branch = this.request.body.branch;
        var phone = this.request.body.phone;
        var name = this.request.body.name;
        try{
            var res = yield databaseUtils.executeQuery(util.format('insert into user(name,phone,email,password,year,branch_id,course_id) values("%s","%s","%s","%s","%s","%s","%s")',name,phone,email,password,year,branch,course));
                this.body = {status:'1'}
        }catch (e) {
            console.log(e,'error');
            this.body = {status:'0'}
        }
    },
    showLogin:function *(next) {
        yield this.render('login',{});
    },
    login:function *(next) {
        var email = this.request.body.email;
        var password = this.request.body.password;
        var res = yield databaseUtils.executeQuery(util.format('select * from user where email="%s" and password="%s"',email,password));
        if (res.length==0){
            this.body = {status:'0'}
        } else{
            var user = res[0];
            sessionUtils.saveUserInSession(user,this.cookies);
            this.body = {status:'1'}
        }
    },
    showDash:function *(next) {
        var res = yield databaseUtils.executeQuery(util.format('select * from module where user_id="%s"',this.currentUser.id));
        if (res.length==0){
            yield this.render('start',{});
        }
        else
        {

            res = yield databaseUtils.executeQuery(util.format('select count(*) as c from scoreboard where user_id="%s"',this.currentUser.id));

          //  console.log('res',res[0].c);

            if (res[0].c==0) {

                function shuffle(array) {
                    var currentIndex = array.length, temporaryValue, randomIndex;

                    // While there remain elements to shuffle...
                    while (0 !== currentIndex) {

                        // Pick a remaining element...
                        randomIndex = Math.floor(Math.random() * currentIndex);
                        currentIndex -= 1;

                        // And swap it with the current element.
                        temporaryValue = array[currentIndex];
                        array[currentIndex] = array[randomIndex];
                        array[randomIndex] = temporaryValue;
                    }

                    return array
                }


                var res = yield databaseUtils.executeQuery(util.format('select * from module where user_id="%s"', this.currentUser.id));
                var domain1 = res[0].m1;
                var domain2 = res[0].m2;

                var domains = yield databaseUtils.executeQuery(util.format('select * from domain where id="%s" or id="%s"', domain1, domain2));


                var common_count = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20];
                var d1_count = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
                var d2_count = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

                d1_count = shuffle(d1_count);
                d2_count = shuffle(d2_count);
                common_count = shuffle(common_count);

                var common_que = yield databaseUtils.executeQuery(util.format('select * from ques where domain_id=1'));
                var d1_que = yield databaseUtils.executeQuery(util.format('select * from ques where domain_id="%s"', domain1));
                var d2_que = yield databaseUtils.executeQuery(util.format('select * from ques where domain_id="%s"', domain2));

                var common = [];
                var d1 = [];
                var d2 = [];

                for (var i in common_count) {
                    common.push(common_que[common_count[i] - 1]);
                }

                for (var i in d1_count) {
                    d1.push(d1_que[d1_count[i] - 1]);
                }

                for (var i in d2_count) {
                    d2.push(d2_que[d2_count[i] - 1]);
                }

             //   console.log(common);
              //  console.log(d1);
              //  console.log(d2);
                var msg = '1';

                res = yield databaseUtils.executeQuery(util.format('select now() as n,t,TIMESTAMPADD(MINUTE,30,t) as aim from test'));
                console.log(res);




                if (new Date(res[0].aim)<new Date(res[0].n)) msg='2';
                if (new Date(res[0].n)<new Date(res[0].t)) msg='3';

                yield this.render('dashboard', {
                    common: common, d1: d1, d2: d2, domains: domains, msg:msg, n:res[0].n, t:res[0].t, aim:res[0].aim
                });
           }
            else{
                var common,d1,d2,domains,msg='0';
                yield this.render('dashboard', {
                    common: common, d1: d1, d2: d2, domains: domains, msg:msg, n:'', t:'', aim:res[0].aim
                });
            }
        }

    },
    addque:function *(next) {
        var domains = yield databaseUtils.executeQuery(util.format('select * from domain'));

        yield this.render('addque',{domains:domains})
    },
    newque:function *(next) {
        var que = this.request.body.que;
        var options = this.request.body.option;
        var optiona = this.request.body.optiona;
        var optionb = this.request.body.optionb;
        var optionc = this.request.body.optionc;
        var optiond = this.request.body.optiond;
        var optione = this.request.body.optione;
        var domain_id = this.request.body.domain;

        var ans = 0;
        for (var i in options){
            ans = ans|(1<<parseInt(options[i]));
        }

        var res = yield databaseUtils.executeQuery(util.format('insert into ques(statement,optiona,optionb,optionc,optiond,optione,answer,domain_id) values("%s","%s","%s","%s","%s","%s","%s","%s")',que,optiona,optionb,optionc,optiond,optione,ans,domain_id));
        this.redirect('/addque');
    },
    addmod:function *(next) {
        var id = this.currentUser.id;
        var domains = this.request.body.option;
        console.log(domains);

        var res = yield databaseUtils.executeQuery(util.format('insert into module(user_id,m1,m2) values("%s","%s","%s")',id,domains[0],domains[1]));
        this.redirect('/dashboard');
    },
    quiz:function *(next) {
        console.log(this.request.body);
        var data = this.request.body;
        var res;
        var id = this.currentUser.id;

        res = yield databaseUtils.executeQuery(util.format('insert into submission(user_id,ques_id,answer) values("%s","%s","%s")'+',("%s","%s","%s")'.repeat(19+10+10),id,data['id_que_0'],data['ans_que_0'] ,id,data['id_que_1'],data['ans_que_1'] ,id,data['id_que_2'],data['ans_que_2'] ,id,data['id_que_3'],data['ans_que_3'] ,id,data['id_que_4'],data['ans_que_4'] ,id,data['id_que_5'],data['ans_que_5'] ,id,data['id_que_6'],data['ans_que_6'] ,id,data['id_que_7'],data['ans_que_7'] ,id,data['id_que_8'],data['ans_que_8'] ,id,data['id_que_9'],data['ans_que_9'] ,id,data['id_que_10'],data['ans_que_10'] ,id,data['id_que_11'],data['ans_que_11'] ,id,data['id_que_12'],data['ans_que_12'] ,id,data['id_que_13'],data['ans_que_13'] ,id,data['id_que_14'],data['ans_que_14'] ,id,data['id_que_15'],data['ans_que_15'] ,id,data['id_que_16'],data['ans_que_16'] ,id,data['id_que_17'],data['ans_que_17'] ,id,data['id_que_18'],data['ans_que_18'] ,id,data['id_que_19'],data['ans_que_19'],id,data['id_d1_0'],data['ans_d1_0'] ,id,data['id_d1_1'],data['ans_d1_1'] ,id,data['id_d1_2'],data['ans_d1_2'] ,id,data['id_d1_3'],data['ans_d1_3'] ,id,data['id_d1_4'],data['ans_d1_4'] ,id,data['id_d1_5'],data['ans_d1_5'] ,id,data['id_d1_6'],data['ans_d1_6'] ,id,data['id_d1_7'],data['ans_d1_7'] ,id,data['id_d1_8'],data['ans_d1_8'] ,id,data['id_d1_9'],data['ans_d1_9'],id,data['id_d2_0'],data['ans_d2_0'] ,id,data['id_d2_1'],data['ans_d2_1'] ,id,data['id_d2_2'],data['ans_d2_2'] ,id,data['id_d2_3'],data['ans_d2_3'] ,id,data['id_d2_4'],data['ans_d2_4'] ,id,data['id_d2_5'],data['ans_d2_5'] ,id,data['id_d2_6'],data['ans_d2_6'] ,id,data['id_d2_7'],data['ans_d2_7'] ,id,data['id_d2_8'],data['ans_d2_8'] ,id,data['id_d2_9'],data['ans_d2_9']));

        res = yield databaseUtils.executeQuery(util.format('select count(*) as score from submission s left join ques q on s.ques_id=q.id where s.user_id="%s" and s.answer=q.answer',this.currentUser.id));

        res = yield databaseUtils.executeQuery(util.format('insert into scoreboard(user_id,score) values("%s","%s")',this.currentUser.id,res[0].score));


        this.redirect('/dashboard');
    },
    scoreboard:function *(next) {

        var entry;
        entry = yield databaseUtils.executeQuery(util.format('select u.name,u.year,s.* from scoreboard s left join user u on s.user_id=u.id order by s.score desc,s.ts'));

        yield this.render('scoreboard',{
            entry:entry
        });
    },
    getQuestions:function *(next) {

        function shuffle(array) {
            var currentIndex = array.length, temporaryValue, randomIndex;

            // While there remain elements to shuffle...
            while (0 !== currentIndex) {

                // Pick a remaining element...
                randomIndex = Math.floor(Math.random() * currentIndex);
                currentIndex -= 1;

                // And swap it with the current element.
                temporaryValue = array[currentIndex];
                array[currentIndex] = array[randomIndex];
                array[randomIndex] = temporaryValue;
            }

            return array
        }

        var sha256 = function sha256(ascii) {
            function rightRotate(value, amount) {
                return (value>>>amount) | (value<<(32 - amount));
            };

            var mathPow = Math.pow;
            var maxWord = mathPow(2, 32);
            var lengthProperty = 'length'
            var i, j; // Used as a counter across the whole file
            var result = ''

            var words = [];
            var asciiBitLength = ascii[lengthProperty]*8;

            //* caching results is optional - remove/add slash from front of this line to toggle
            // Initial hash value: first 32 bits of the fractional parts of the square roots of the first 8 primes
            // (we actually calculate the first 64, but extra values are just ignored)
            var hash = sha256.h = sha256.h || [];
            // Round constants: first 32 bits of the fractional parts of the cube roots of the first 64 primes
            var k = sha256.k = sha256.k || [];
            var primeCounter = k[lengthProperty];
            /*/
            var hash = [], k = [];
            var primeCounter = 0;
            //*/

            var isComposite = {};
            for (var candidate = 2; primeCounter < 64; candidate++) {
                if (!isComposite[candidate]) {
                    for (i = 0; i < 313; i += candidate) {
                        isComposite[i] = candidate;
                    }
                    hash[primeCounter] = (mathPow(candidate, .5)*maxWord)|0;
                    k[primeCounter++] = (mathPow(candidate, 1/3)*maxWord)|0;
                }
            }

            ascii += '\x80' // Append Ƈ' bit (plus zero padding)
            while (ascii[lengthProperty]%64 - 56) ascii += '\x00' // More zero padding
            for (i = 0; i < ascii[lengthProperty]; i++) {
                j = ascii.charCodeAt(i);
                if (j>>8) return; // ASCII check: only accept characters in range 0-255
                words[i>>2] |= j << ((3 - i)%4)*8;
            }
            words[words[lengthProperty]] = ((asciiBitLength/maxWord)|0);
            words[words[lengthProperty]] = (asciiBitLength)

            // process each chunk
            for (j = 0; j < words[lengthProperty];) {
                var w = words.slice(j, j += 16); // The message is expanded into 64 words as part of the iteration
                var oldHash = hash;
                // This is now the undefinedworking hash", often labelled as variables a...g
                // (we have to truncate as well, otherwise extra entries at the end accumulate
                hash = hash.slice(0, 8);

                for (i = 0; i < 64; i++) {
                    var i2 = i + j;
                    // Expand the message into 64 words
                    // Used below if
                    var w15 = w[i - 15], w2 = w[i - 2];

                    // Iterate
                    var a = hash[0], e = hash[4];
                    var temp1 = hash[7]
                        + (rightRotate(e, 6) ^ rightRotate(e, 11) ^ rightRotate(e, 25)) // S1
                        + ((e&hash[5])^((~e)&hash[6])) // ch
                        + k[i]
                        // Expand the message schedule if needed
                        + (w[i] = (i < 16) ? w[i] : (
                                w[i - 16]
                                + (rightRotate(w15, 7) ^ rightRotate(w15, 18) ^ (w15>>>3)) // s0
                                + w[i - 7]
                                + (rightRotate(w2, 17) ^ rightRotate(w2, 19) ^ (w2>>>10)) // s1
                            )|0
                        );
                    // This is only used once, so *could* be moved below, but it only saves 4 bytes and makes things unreadble
                    var temp2 = (rightRotate(a, 2) ^ rightRotate(a, 13) ^ rightRotate(a, 22)) // S0
                        + ((a&hash[1])^(a&hash[2])^(hash[1]&hash[2])); // maj

                    hash = [(temp1 + temp2)|0].concat(hash); // We don't bother trimming off the extra ones, they're harmless as long as we're truncating when we do the slice()
                    hash[4] = (hash[4] + temp1)|0;
                }

                for (i = 0; i < 8; i++) {
                    hash[i] = (hash[i] + oldHash[i])|0;
                }
            }

            for (i = 0; i < 8; i++) {
                for (j = 3; j + 1; j--) {
                    var b = (hash[i]>>(j*8))&255;
                    result += ((b < 16) ? 0 : '') + b.toString(16);
                }
            }
            return result;
        };



        var res = yield databaseUtils.executeQuery(util.format('select * from module where user_id="%s"', this.currentUser.id));
        var domain1 = res[0].m1;
        var domain2 = res[0].m2;

        var domains = yield databaseUtils.executeQuery(util.format('select * from domain where id="%s" or id="%s"', domain1, domain2));


        var common_count = [];
        for(var i=1;i<=40;++i){
            common_count.push(i);
        }

        common_count = shuffle(common_count);

        var common_que = yield databaseUtils.executeQuery(util.format('select * from ques where domain_id=1'));
        var d1_que = yield databaseUtils.executeQuery(util.format('select * from ques where domain_id="%s"', domain1));
        var d2_que = yield databaseUtils.executeQuery(util.format('select * from ques where domain_id="%s"', domain2));

        var ques = [];
        var temp_ques = common_que.concat(d2_que.concat(d1_que));

        for (var i in common_count) {
            ques.push(temp_ques[common_count[i] - 1]);
        }


        for (var i in ques){
            ques[i].answer = sha256(ques[i].answer);
        }

        var msg = '1';

        res = yield databaseUtils.executeQuery(util.format('select now() as n,t,TIMESTAMPADD(MINUTE,30,t) as aim from test'));
        console.log(res);

        if (new Date(res[0].aim)<new Date(res[0].n)) msg='2';
        if (new Date(res[0].n)<new Date(res[0].t)) msg='3';

        this.body = {ques:ques, domains: domains, msg:msg, n:res[0].n, t:res[0].t, aim:res[0].aim}
    },
    submitTest:function *(next) {

        console.log('submit');


        var score = this.request.body.score;

        res = yield databaseUtils.executeQuery(util.format('insert into scoreboard(user_id,score) values("%s","%s")',this.currentUser.id,score));

        this.status = 200;

    }
}
