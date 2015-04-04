<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>

<c:url value="/users/records" var="recordsUrl"/>
<c:url value="/users/create" var="addUrl"/>
<c:url value="/users/update" var="editUrl"/>
<c:url value="/users/delete" var="deleteUrl"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/style.css"/>'/>
        <link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/userTable.css"/>'/>
         <link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/button.css"/>'/>
        <link rel='stylesheet' type='text/css' media='screen' href='<c:url value="/resources/css/bootstrap-theme.in.css"/>'/>
	<script type='text/javascript' src='<c:url value="/resources/js/jquery-1.6.4.min.js"/>'></script>
	<script type='text/javascript' src='<c:url value="/resources/js/custom.js"/>'></script>
        <script type='text/javascript' src='<c:url value="/resources/js/bootstrap.min.js"/>'></script>
       
        <script src='https://www.google.com/recaptcha/api.js'></script>
        
        
        
        
        <script>
	$.validator.setDefaults({
		submitHandler: function() {
			alert("submitted!");
		}
	});

	$().ready(function() {
		// validate the comment form when it is submitted
		$("#newForm").validate();
	</script>
	<style>
	#commentForm {
		width: 500px;
	}
	#commentForm label {
		width: 250px;
	}
	#commentForm label.error, #commentForm input.submit {
		margin-left: 253px;
	}
	
	</style>
        
<script src="//cdn.jsdelivr.net/jquery.validation/1.13.1/additional-methods.js"></script>
<script src="//cdn.jsdelivr.net/jquery.validation/1.13.1/jquery.validate.js"></script>
<script src="//cdn.jsdelivr.net/jquery.validation/1.13.1/jquery.validate.min.js"></script>
<script src="//cdn.jsdelivr.net/jquery.validation/1.13.1/localization/messages_tr.js"></script>


        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
        <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript-->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
 
        
	<title>User Records</title>
	
	<script type='text/javascript'>
                
        
                
                
                
	$(function() {
		// init
		urlHolder.records = '${recordsUrl}';
		urlHolder.add = '${addUrl}';
		urlHolder.edit = '${editUrl}';
		urlHolder.del = '${deleteUrl}';
		loadTable();
		
		$('#newBtn').click(function() { 
			toggleForms('new');
			toggleCrudButtons('hide');
		});
		
		$('#editBtn').click(function() { 
			if (hasSelected()) {
				toggleForms('edit');
				toggleCrudButtons('hide');
				fillEditForm();
			}
		});
		
		$('#reloadBtn').click(function() { 
			loadTable();
		});

		$('#deleteBtn').click(function() {
			if (hasSelected()) { 
				submitDeleteRecord();
			}
		});
		
		$('#newForm').submit(function() {
			event.preventDefault();
			submitNewRecord();
                        
                       
		});
         

                 $('#newPhone', '#newForm')

	.keydown(function (e) {
		var key = e.charCode || e.keyCode || 0;
		$phone = $(this);

		// Auto-format- do not expose the mask as the user begins to type
		if (key !== 8 && key !== 9) {
			if ($phone.val().length === 4) {
				$phone.val($phone.val() + ')');
			}
			if ($phone.val().length === 5) {
				$phone.val($phone.val() + ' ');
			}			
			if ($phone.val().length === 9) {
				$phone.val($phone.val() + '-');
			}
		}

		// Allow numeric (and tab, backspace, delete) keys only
		return (key == 8 || 
				key == 9 ||
				key == 46 ||
				(key >= 48 && key <= 57) ||
				(key >= 96 && key <= 105));	
	})
	
	.bind('focus click', function () {
		$phone = $(this);
		
		if ($phone.val().length === 0) {
			$phone.val('(');
		}
		else {
			var val = $phone.val();
			$phone.val('').val(val); // Ensure cursor remains at the end
		}
	})
	
	.blur(function () {
		$phone = $(this);
		
		if ($phone.val() === '(') {
			$phone.val('');
		}
	});       

	
		
		$('#editForm').submit(function() {
			event.preventDefault();
			submitUpdateRecord();
		});

		$('#closeNewForm').click(function() { 
			toggleForms('hide'); 
			toggleCrudButtons('show');
		});
		
		$('#closeEditForm').click(function() { 
			toggleForms('hide'); 
			toggleCrudButtons('show');
		});
	});
	</script>
</head>

<body>
<div class="container">
    
	<h1 id='banner'>Kullanıcı Yönetim Sistemi</h1>
	<hr/>
	
        <table id='tableUsers'>
		
		<thead>
			<tr>
                                <th>Seçim</th>
                                <th>Kullanıcı</th>
				<th>Ad</th>
				<th>Soyad</th>
                                <th>Telefon</th>
				
                                
			</tr>
		</thead>
	</table>
        <br>
       
        
	<div id='controlBar'>
		<input type='button' class='button' value='Yeni' id='newBtn' />
		<input type='button' class='button' value='Sil' id='deleteBtn' />
		<input type='button' class='button' value='Düzenle' id='editBtn' />
		<input type='button' class='button' value='Yenile' id='reloadBtn' />
	</div>
	
	<div id='newForm'>
            <form id="newForm" method="get" action="">
  			<fieldset>
				<legend>Yeni Kayıt Oluştur</legend>
				
                                <p>	<label for='newUsername'>Kullanici</label>
                                <input name="newUsername" type='text' id='newUsername' required><br/>
                                </p>
                                <p>
                                <label for='newFirstName'>Adı</label>
                                <input name="newFirstName"type='text' id='newFirstName'required><br/>
                                </p>
                                <p>
                                    <label for='newLastName'>Soyadı</label>
                                <input name="newLastName"type='text' id='newLastName'required><br/>
                                 </p>
                                 <p>
                                <label for='newPhone'>Telefonu</label>
                                 <input name="newPhone"type='text' maxlength="14" placeholder="(XXX) XXX-XXXX" id='newPhone'required><br/>
                                 </p>
				
                                 <p>
                                 <div class="g-recaptcha" data-sitekey="6Lc6iMsSAAAAAEUQTVMzzv2qLZsMQy1UB4bKb8ns" required> </div>
                                 
                                 </p>
  			</fieldset>
			<input type='button'class='button' value='Kapat' id='closeNewForm' />
			<input type='submit' class='button' value='Onayla'/>
		</form>
	</div>
	
	<div id='editForm'>
		<form>
  			<fieldset>
				<legend>Kayıt Düzenle</legend>
				<input type='hidden' id='editUsername'/>
				<label for='editFirstName'>Ad</label>
                                <input type='text' id='editFirstName'/><br/>
				<label for='editLastName'>Soyad</label>
                                <input type='text' id='editLastName'/><br/>
                                <label for='editPhone'>Telefon</label>
                                <input type='text' id='editPhone'/><br/>
				
                                
			</fieldset>
			<input type='button' class='button' value='Kapat' id='closeEditForm' />
			<input type='submit' class='button' value='Onayla'/>
		</form>
	</div>

</div>
</div>
</body>
</html>