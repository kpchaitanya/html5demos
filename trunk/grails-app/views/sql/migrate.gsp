<html>
    <head>
        <title>Notes</title>
		<meta name="layout" content="webkit" />

		<style>

		
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
				
	
				//get current db
				$i.db = $i.prepareDatabase();
					
			}
			
			$i.errorStatementCallback = function(transaction, error)
			{
				alert('errorCallBack: ' + error.code + ' / message: ' + error.message);
				return true; //true = roll back transaction, false = execution continues
				//transaction kann zum error loggign verwendet werden.  
			};	
			
			$i.cv_0_0_1_0 = function(transaction)
			{
					transaction.executeSql('CREATE TABLE IF NOT EXISTS notes (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, note TEXT);');							
			};
			
			$i.cv_failure_0_0_1_0 = function(error)
			{
				alert('Fehler in Migration von 0.0 -> 1.0 conversion. ' + error.message);
				return true;
			};	
			
			$i.cv_success_0_0_1_0 = function()
			{
				alert('DB auf 1.0 migriert');
			};
			
	
			
			$i.prepareDatabase = function()
			{
				try 
				{
					var db = openDatabase('someDB', '', 'Migration Test', 5*1024*1024);		
					
					if (db.version == '')
					{
						//brand new, creating current schema and setting version
						db.changeVersion("", "1.0", $i.cv_0_0_1_0, $i.cv_failure_0_0_1_0, $i.cv_success_0_0_1_0);						
					}
					else if (db.version == '1.0')
					{
						alert('got v1.0, all good');
						//sobald sich die DB veraendert, wird hier db.changeVersion aufgerufen
						//gleichzeitig wird die Erzeugung der DB so veraendert, dass sofort die aktuellste version erstellt wird
						//db.changeVersion("1.0", "2.0", $i.cv_1_0_2_0, $i.cv_failure_1_0_2_0, $i.cv_success_1_0_2_0);
						
					}
				
					return db;
				}
				catch(e)
				{
				    alert('Konnte DB nicht oeffnen. Aktuelle version: ' + db.version);
				}
				  
			};
			
			addEventListener('DOMContentLoaded', $i.init, true);					
			
		}).call();
		
		
		</script>
    </head>
    <body>
		
		<div id="topbar">
			<div id="title">DB Migration</div>
		</div>

		<div id="content">
	
			<ul class="pageitem">
				<li class="textbox"><span id="msg">Beim ersten Aufruf wird die DB someDB auf die Version 1.0 'migriert', es wird das initiale Schema erstellt. Sobald sich die Anwendung aendert, kann dann analog eine Migration auf die naechste Version stattfinden.</span></li>
			</ul>
	
					
		</div>
		
    </body>
</html>