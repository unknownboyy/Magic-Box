

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


function  timer(){
    var h = $('#hour').html();
    var m = $('#minute').html();
    var s = $('#second').html();
    --s;
    if (s<0) { s=59;m--; }
    if(m<0) { m=59;h--;}
    if (h<=0 && m<=0 && s<=0){
        if($('#quizform').attr('action')){
            alert('Contest Ended');
            $(window).unbind('blur');
            $('#quizform').submit();
        }else{
            alert('Contest Started');
            window.location.reload();
        }
    }
    $('#hour').html(h);
    $('#minute').html(m);
    $('#second').html(s);

    console.log('Timer()');
}

$(document).ready(function() {

    var status = $('#status').val();
    if (status == 1){
        $.post('/getQuestions',function (data,status) {

            if (status == 'success'){

                console.log(data.ques);
                var count = 0;
                var answers = [];
                var ids = [];
                var score = 0;

                $('.mystatement').html(data.ques[0].statement);
                $('.optiona,.optionb,.optionc,.optiond,.optione').prop('selected',false);
                $('.answer').val(0);
                $('#domain_id').val(data.ques[0].domain_id);

                $('.a').html(data.ques[0].optiona);
                $('.b').html(data.ques[0].optionb);
                $('.c').html(data.ques[0].optionc);
                $('.d').html(data.ques[0].optiond);
                $('.e').html(data.ques[0].optione);

                count++;

                $('#que_badge').html(1);

                $('[href="#que"]').tab('show');

                $('.confirmBtn').click(function () {
                    if (count<40){
                        answers.push($('.answer').val());
                        if( sha256(answers[count-1]) == data.ques[count-1].answer){
                            score++;
                        }

                        $('.mystatement').html(data.ques[count].statement);
                        $('.optiona,.optionb,.optionc,.optiond,.optione').prop('checked',false);
                        $('.answer').val(0);
                        $('#domain_id').val(data.ques[count].domain_id);
                        $('.a').html(data.ques[count].optiona);
                        $('.b').html(data.ques[count].optionb);
                        $('.c').html(data.ques[count].optionc);
                        $('.d').html(data.ques[count].optiond);
                        $('.e').html(data.ques[count].optione);
                        count++;
                        $('#que_badge').html(count);
                    } else if(count==40){



                        answers.push($('.answer').val());

                        if( sha256(answers[count-1]) == data.ques[count-1].answer ){
                            score++;
                        }

                        count++;
                    }
                    else{
                        $.post('/submitTest',{score:score},function (data,status) {
                            if (status == 'success'){
                                console.log('Test Submitted');
                                window.location.reload();
                            }
                        });

                    }
                })

            }
        });



    }

    var warning = 2;

    if($('#quizform').attr('action')){
        timer();
        setInterval(timer,1000);

        // $(window).bind('blur',function () {
        //     if (warning==0){
        //         $('#quizform').submit();
        //     }else{
        //         alert('Swtiching Is Not Allowed');
        //         warning--;
        //     }
        // });
        // $(window).bind('beforeunload',function () {
        //     $('#quizform').submit();
        // });

    }else if ($('#timer').attr('data-cap')){
        timer();
        setInterval(timer,1000);
    }


    // $('.confirmBtn').click(function () {
    //     $(this).parent().attr('id',null);
    //     $('#que_badge'+$(this).attr('data-cap')).removeClass('badge-danger');
    //     $('#que_badge'+$(this).attr('data-cap')).addClass('badge-success');
    // });
    //
    // $('.confirmBtn2').click(function () {
    //     $(this).parent().attr('id',null);
    //     $('#d1_badge'+$(this).attr('data-cap')).removeClass('badge-danger');
    //     $('#d1_badge'+$(this).attr('data-cap')).addClass('badge-success');
    // });
    //
    //
    // $('.confirmBtn3').click(function () {
    //     $(this).parent().attr('id',null);
    //     $('#d2_badge'+$(this).attr('data-cap')).removeClass('badge-danger');
    //     $('#d2_badge'+$(this).attr('data-cap')).addClass('badge-success');
    // });




    $('.optiona').click(function () {
        var ele = $(this).parent().parent().parent().parent().parent().parent().parent().find('.answer');
        ele.val(ele.val()^(1<<1));
    });

    $('.optionb').click(function () {
        var ele = $(this).parent().parent().parent().parent().parent().parent().parent().find('.answer');
        ele.val(ele.val()^(1<<2));
    });

    $('.optionc').click(function () {
        var ele = $(this).parent().parent().parent().parent().parent().parent().parent().find('.answer');
        ele.val(ele.val()^(1<<3));
    });

    $('.optiond').click(function () {
        var ele = $(this).parent().parent().parent().parent().parent().parent().parent().find('.answer');
        ele.val(ele.val()^(1<<4));
    });

    $('.optione').click(function () {
        var ele = $(this).parent().parent().parent().parent().parent().parent().parent().find('.answer');
        ele.val(ele.val()^(1<<5));
    });

});