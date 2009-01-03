# Copyright (c) 2005 Assembla, Inc.
# Portions  Copyright (c) 2008 Intuit
#
# This plugin for ActiveRecord makes the "ID" field into a URL-safe GUID
# It is a mashup by Andy Singleton <andy@assembla.com> that includes 
# * the UUID class from Bob Aman.
# * the plugin skeleton from Demetrius Nunes
# * the 22 character URL-safe format from Andy Singleton
# You can get standard 36 char UUID formats instead
# TODO: Auto-detect a character ID field and use a GUID in this case (DRY principle)
# 
# It has been extended by Brian Morearty with:
# * the addition of a mysql_create function (configurable with a guid_generator accessor)
#   for much better performance
# * id assignment is now done before_create instead of after_initialize, to more closely
#   mimic the default Rails behavior of assigning an id upon save.
# 
# This library is free software; you can redistribute it and/or modify it
# under the terms of the MIT license.
# 
# TO USE
# Install as a plugin in the rails directory vendor/plugin/guid
# define ID as char(22)
# call "usesguid" in ActiveRecord class declaration, like
# class Mymodel < ActiveRecord::Base
#	usesguid			
#
# if your ID field is not called "ID", call "usesguid :column =>'IdColumnName' "
#
# If you use MySQL as your database, you can make guid generation much faster
# by putting this in config/environment.rb:
#   ActiveRecord::Base.guid_generator = :mysql

require 'usesguid'
