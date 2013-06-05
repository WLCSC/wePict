WePict
=========

WePict is a classroom response system of sorts that allows students to submit drawings & have them displayed to the classroom.

How-To
------
* bundle install
* Edit/create config/database.yml, config/app_config.yml, and config/private_pub.yml
* rake db:setup
 
Note that you need the Faye server running in addition to the regular rails server - there's a rackup file that takes care of that.

    rackup private_pub.ru -s thin -E production

This can use LDAP and/or a local set of users for authentication.  LDAP users get automatically created the first time they log in.  There's a rake task to create an initial local user if you need one as well (rake adduser).

    WePict is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    WePict is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with WePict.  If not, see <http://www.gnu.org/licenses/>.

