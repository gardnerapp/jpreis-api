# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

DataApi.create([{
                 name: "Communication History", 
                 endpoint: "/svc/bw/data/communication-history?",
                 queryparameters: "filtertype={filtertype} &loginname={loginname}
&starttime={starttime} &endtime={endtime}
&timezone={timezone} &timeformat={timeformat}
&pagenum={pagenum} &numrecsperpage={numrecsperpage}
&deviceid={deviceid} &eventtype={eventtype}"
               }])