<html>
    <head>
        <title>Notes</title>
		<meta name="layout" content="webkit" />

		<style>
		.menu .delete {
			position: absolute;
			width: 70px!important;
			height: 30px!important;
			right: 10px;
			top: 6px;
			margin: 0!important;
			background: url("../images/delete.png") 0 0 no-repeat
		}	
		
		.hidden {
			display: none;
		}	
		
		</style>

		
		<script>
		
		(function my() {
			
			var $i = {};
			
			$i.hasSQL = function()
			{
				return typeof window.openDatabase == "function" ? true : false;
			};
			
			
			$i.init = function()
			{
				if (!$i.hasSQL())
				{
					alert('No SQL Database, no fun!');
					return;
				}
				
				document.getElementById('createButton').addEventListener('click', function(e){
					document.getElementById('newnoteTitle').style.display = "block";
					document.getElementById('newnoteForm').style.display = "block";
				}, true);
				
				
				document.getElementById('save').addEventListener('click', function(e){
					var newNoteText = document.getElementById('note').value;

					if (!$i.selected)
					{					
						$i.db.transaction(function(t){
							t.executeSql('INSERT INTO notes (note) VALUES (?);', [newNoteText], function(t, resultSet){
								$i.displayNotes();
							}, $i.errorStatementCallback);
						});
					
					}
					else
					{
						$i.db.transaction(function(t){
							t.executeSql('UPDATE notes set note=?, date=CURRENT_TIMESTAMP WHERE id=?;', [newNoteText, $i.selected], function(t, resultSet){
								$i.displayNotes();
								$i.selected = false;
							}, $i.errorStatementCallback);
						});						
					}
					
					//hide form, reset
					document.getElementById('note').value = '';
					document.getElementById('deleteLi').style.display = "none";
					document.getElementById('newnoteTitle').style.display = "none";
					document.getElementById('newnoteForm').style.display = "none";					
				}, true);
				
				document.getElementById('delete').addEventListener('click', function(e){
					var ok = confirm("Wirklich?");
					
					if (!ok)
						return;
					
					$i.db.transaction(function(t){
						t.executeSql('DELETE FROM notes WHERE id = ?', [$i.selected], function(t, resultSet){
							//alert(resultSet.rowsAffected);
							$i.displayNotes();
							$i.selected = false;
							document.getElementById('note').value = '';
							document.getElementById('deleteLi').style.display = "none";
							document.getElementById('newnoteTitle').style.display = "none";
							document.getElementById('newnoteForm').style.display = "none";							
						}, $i.errorStatementCallback);
					});
				}, true);				
								
				
				document.getElementById('deleteAll').addEventListener('click', function(e){
					var ok = confirm("Alle Notizen loeschen?");

					if (!ok)
						return;

						$i.db.transaction(function(t){
							t.executeSql('DELETE FROM notes', null, function(t, resultSet){
								alert(resultSet.rowsAffected + ' Notizen geloescht.');
								$i.displayNotes();

							}, $i.errorStatementCallback);
						});
				}, true);				
				
				//get current db or create
				$i.db = $i.prepareDatabase();
				
				$i.displayNotes();	
			}
			
			$i.editNote = function(e) 
			{
				var id = parseInt(e.currentTarget.id, 10);
				
				$i.db.transaction(function(t){
					t.executeSql('SELECT * FROM notes WHERE id = ?', [id], function(transaction, resultSet){
						//alert(resultSet.rows.length);
						var row = resultSet.rows.item(0);
						document.getElementById('note').value = row.note;
						$i.selected = row.id;
					}, $i.errorStatementCallback)
				});
				
				document.getElementById('deleteLi').style.display = "block";
				document.getElementById('newnoteTitle').style.display = "block";
				document.getElementById('newnoteForm').style.display = "block";				
				
			}
			
			$i.displayNotes = function(){
				var existingNode = document.getElementById('existing');
				existingNode.innerHTML = '';
				
				$i.db.transaction(function(t){
					t.executeSql('SELECT * FROM notes ORDER BY date DESC;', null, function(transaction, resultSet){
						var i, row, newLi, newSpan, commentSpan;
						//alert("got " + resultSet.rows.length + ' rows in the db');
						for (i = 0; i < resultSet.rows.length; i++)
						{
							row = resultSet.rows.item(i);
							//<li class="menu note" id="note1"><span class="name">Meine erste...</span></li>
							newLi = document.createElement('li');
							newLi.setAttribute('class', 'menu note');
							newLi.setAttribute('id', row.id);
							newSpan = document.createElement('span');
							newSpan.setAttribute('class', 'name');
							newSpan.textContent = row.note.substring(0,10) + '...';
							newLi.appendChild(newSpan);
							commentSpan = document.createElement('span');
							commentSpan.setAttribute('class', 'comment');
							commentSpan.textContent = row.date;
							newLi.appendChild(commentSpan);
							
							newLi.addEventListener('click', $i.editNote, false);
							
							document.getElementById('existing').appendChild(newLi);
						}
					}, $i.errorStatementCallback);
				}/*errorCallback, successCallback*/);
			};
			
			$i.errorCallback = function(error)
			{
				alert('errorCallBack: ' + error.code + ' / message: ' + error.message);
			};
			
			$i.errorStatementCallback = function(transaction, error)
			{
				alert('errorCallBack: ' + error.code + ' / message: ' + error.message);
				return true; //true = roll back transaction, false = execution continues
				//transaction kann zum error loggign verwendet werden.  
			};			
		
			
			$i.prepareDatabase = function()
			{
				
				//migration using:
				/*
				var db = openDatabase(shortName, "", displayName, maxSize);

				var version = db.version; // For example, "1.0"				
				*/
				//or try/catch

				try 
				{
					var db = openDatabase('notes', '1.0', 'Offline Notes Storage', 5*1024*1024);
				
					db.transaction(function(t){
						t.executeSql('CREATE TABLE IF NOT EXISTS notes (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, note TEXT, date DATE NOT NULL DEFAULT CURRENT_TIMESTAMP);');					
					}, $i.errorStatementCallback);
					
					//if (db.changeVersion)
					//	alert('can change version');
				
					return db;
				}
				catch(e)
				{
				    if (e == 2) 
				        alert("Invalid database version.");
					else
				    	alert("Unknown error "+e+".");
				}
				  
			};
			
			addEventListener('DOMContentLoaded', $i.init, true);					
			
		}).call();
		
		
		</script>
    </head>
    <body>
		
		<div id="topbar">
			<div id="title">Notes</div>
		</div>
		<span id="msg"></span>
		<div id="content">
			<span class="graytitle">Bestehende Notizen</span>
			<ul class="pageitem" id="existing">
				<li class="menu note" id="note1"><span class="name">Meine erste...</span></li>
			</ul>
			<span id="newnoteTitle" style="display:none;" class="graytitle">Notiz bearbeiten</span>				
			<ul id="newnoteForm" style="display:none;" class="pageitem" id="createEditNote">
				<li class="textbox"><textarea id="note" rows="4"></textarea></li>
				<li class="button" style="display:none;" id="deleteLi"><input id="delete" type="submit" value="Loeschen..." /></li>	
				<li class="button"><input id="save" type="submit" value="Speichern" /></li>
			</ul>
			
			<ul class="pageitem" id="actions">
					<li class="button"><input id="createButton" type="submit" value="Neue Notiz..." /></li>
					<li class="button"><input id="deleteAll" type="submit" value="Alle loeschen..." /></li>																						
			</ul>							
					
		</div>
		
    </body>
</html>