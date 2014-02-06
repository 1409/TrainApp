class ProjectsController < ApplicationController
	#Hier wird die Methode "Neue Übung" bezeichnet
	def index
		@projects = Project.all
	end
end
