class Load	 

	#///////////////////////////////////////////////////////////////////////////////////////////////////
	# ENABLE/DISABLE DB SNAPSHOTS MANUALLY
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	
	def dbSnapshot (dirname)
		$b.goto($baseURL + "exportDB.php?name=#{dirname}")
		$b.p(:id, 'results').text.include? "Completed"
	end# of reloadDB
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	# LOAD DB SNAPSHOTS
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	def loadDBSnapshot (name)
		$b.goto($baseURL + "importDB.php?name=#{name}")
		$b.p(:id, 'results').text.include? "Completed"
	end# of reloadDB
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	# SCREEN SHOT FUNCION
	#///////////////////////////////////////////////////////////////////////////////////////////////////
	def takeScreenShot(testname,file)
		path = "screenshots/" + testname
		Dir.mkdir(path) unless File.exists?(path)
		$b.screenshot.save(path + "/" + file + ".png")
	end #of takeScreenShot
	#///////////////////////////////////////////////////////////////////////////////////////////////////
end #of Load Class