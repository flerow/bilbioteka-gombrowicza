$(function () {
    function autoHeight() {

        $('#content').css('min-height', 0);
        $('#content').css('min-height', (
                $(document).height()
                - $('#header').height()
                - $('#footer').height()
                ));
    }

    //dynamicly added elements
    //form inputs
    function genInput(type, name, value, placeholder) {
        var input = $('<input>');
        input.attr({
            'type': type,
            'name': name,
            'value': value,
            'placeholder': placeholder
        });
        return input;
    }
    //remove buttons
    function genRemoveButton(response) {
        var removeBtn = $("<button>").text('Usuń książkę');
        removeBtn.addClass('rmv');
        removeBtn.data('id', response.id);
        return removeBtn;
    }
    //form to change data
    function genChangeForm(response) {
        var form = $('<form>').data('id', response.id);
        var submit = genInput('submit', 'go', 'Zmień!', '');
        var title = genInput('text', 'name', '', response.name);
        var author = genInput('text', 'author', '', response.author);
        var field = $('<textarea>').attr({
            'placeholder': 'opis',
            'name': 'description',
            'maxlength': '1000',
        });
        form.append(title);
        form.append($('<br>'));
        form.append(author);
        form.append($('<br>'));
        form.append(field)
        form.append($('<br>'));
        form.append(submit);
        return form;
    }
    //form to add data
    function genAddForm() {
        var form = $('<form>');
        var submit = genInput('submit', 'go', 'Dodaj', '');
        var title = genInput('text', 'name', '', 'nowy tytul');
        var author = genInput('text', 'author', '', 'nowy autor');
        var field = $('<textarea>').attr({
            'placeholder': 'opis',
            'name': 'description',
            'maxlength': '1000',
        });
        form.append(title);
        form.append($('<br>'));
        form.append(author);
        form.append($('<br>'));
        form.append(field)
        form.append($('<br>'));
        form.append(submit);
        return form;
    }
    //p holding data about author
    function genDescription(response) {
        var pAuthor = $('<p>').text(response.author);
        var pDesc = $('<p>').text(response.description);
        var info = $('<div>').append(pAuthor);
        info.addClass('desc');
        info.append(pDesc);
        return info;

    }
    //preparing div with change form and description
    function genInfo(response) {
        var newDiv = $('<div>').addClass('info');
        newDiv.append(genDescription(response));
        newDiv.append(genChangeForm(response));
        newDiv.append(genRemoveButton(response));
        newDiv.attr('hidden', 'true');
        return newDiv;
    }
    //---------------------------------------------
    //fix footer
    autoHeight();
    // printing data about all books from DB
    $.ajax({
        url: 'api/books.php',
        type: 'GET',
        dataType: 'json',
    }).done(function (response) {
        var response = response.map(function (el) {
            return JSON.parse(el);
        });
        console.log(response);
        response.forEach(function (el) {
            var newBox = $('<div>').addClass('solid_box');
            newBox.append($('<h2>').text(el.name));
            newBox.data('id', el.id);
            $('#solid').append(newBox);
        });

    }).fail(function (error) {
        console.log('Error!', error);
    });
    // printing data about particular book from DB
    $('#solid').delegate('h2', 'click', function (event) {
        var thisDiv = $(this).parent();
        if (thisDiv.find('div').length === 0) {
            $.ajax({
                url: 'api/books.php',
                type: 'GET',
                data: {'id': thisDiv.data('id')},
                dataType: 'json',
            }).done(function (response) {
                thisDiv.append(genInfo(response));
                //$('.info').slideUp('fast');
                thisDiv.find('div').slideDown('fast');

            }).fail(function (error) {
                console.log('Error!', error);
            });
        } else {

            //$('.info').slideUp('fast');
            thisDiv.find('div').slideToggle('fast');
        }
    });
    //sending data to change existing book
    $('#solid').delegate('form', 'submit', function (event) {
        event.preventDefault();
        var self = $(this)
        //console.log();
        $.ajax({
            url: 'api/books.php',
            type: 'PUT',
            data: JSON.stringify({
                'id': self.data('id'),
                'name': self.find("input[name='name']").val(),
                'author': self.find("input[name='author']").val(),
                'description':self.find("textarea").val(),
            }),
            dataType: 'json',
        }).done(function (response) {
            console.log(response);
            location.reload();

        }).fail(function (error) {
            console.log('Error!', error);
        });

    });
    //deleting existing book
    $('#solid').delegate('.rmv', 'click', function (event) {
        var self = $(this);
        console.log(self);
        $.ajax({
            url: 'api/books.php',
            type: 'DELETE',
            data: JSON.stringify({
                'id': self.data('id'),
            }),
            dataType: 'json',
        }).done(function (response) {
            console.log(response);
            location.reload();

        }).fail(function (error) {
            console.log('Error!', error);
        });

    });
    //printing adding form
    $('.red').on('click', function (event) {
        if ($('#adds').find('form').length === 0) {
            $('#adds').append(genAddForm().attr('hidden', 'true'));
            $('#adds').find('form').slideDown('fast');
            //$('.info').slideUp('fast');
        } else {
            $('#adds').find('form').slideToggle('fast');
            //$('.info').slideUp('fast');
        }
    });

    //adding new book to database
    $('#adds').delegate('form', 'submit', function (event) {
        event.preventDefault();
        var self = $(this);
        //console.log();
        $.ajax({
            url: 'api/books.php',
            type: 'POST',
            data: {
                name: self.find("input[name='name']").val(),
                author: self.find("input[name='author']").val(),
                description: self.find("textarea").val(),
            },
            dataType: 'json',
        }).done(function (response) {
            console.log(response);
            location.reload();

        }).fail(function (error) {
            console.log('Error!', error);
        });

    });
    $(window).resize(function () {
        autoHeight();
    });
});