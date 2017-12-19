# TS3WI-AdminLTE 
AdminLTE Template for Teamspeak 3 Webinterface by Psychokiller

## Milestones
 - [x] rework all used views (v1.0.0-rc0)
 - [x] change some stuff with JS Plugins (v1.0.0-rc1)
 - [ ] review any new template-file, modernize them, rework any form with tables to vertical form and set xs/sm view (v1.0.0-rc2)
 - [ ] check any view in xs, sm, md & lg (v1.0.0-rc3)
 - [ ] release first full version (v1.0.0)

## ToDo's

### ToDo for v1.0.0-rc1
 - [x] finish filebrowser.tpl (used in tsview)
 - [x] rename oeffnefenster & Klappen function to an english name
 - [x] add redirected oeffnefenster function to the new created function (needed for tsview) 
 - [x] set JavaScript Plugins (e.g. DataTable) lang trough WI Setting
 - [x] serveredit.tpl
    - [x] change yes/no radios to BS-Switch
    - [x] change set icon to modal instead of a popup (can't be done, showallicons isn't a editable template)
 - [x] createserver.tpl
    - [x] change host message radios to a select
    - [x] change yes/no radios to BS-Switch

### Done
 - [x] reviewed fileupload.tpl
 - [x] reviewed temppw.tpl
 - [x] reviewed serveredit.tpl
   - [x] reworked form and reordered boxes
 - [x] reviewed serverview.tpl
 - [x] changed `checked="checked"` to `checked` in any view
 - [x] removed `value=""` in any view
 - [x] merged `mdi-customs.css` with `materialdesignicons.css`
 - [x] ordered css syntaxes in `customs.css`
 - [x] removed unused CSS files
 - [x] reviewed iserverbackup.tpl
 - [x] reviewed logview.tpl
 - [x] reviewed instanceedit.tpl
   - [x] add ability to change checkbox without submit
 - [x] reviewed servertraffic.tpl
   - [x] changed position of `autorefesh`-btn
 - [x] reviewed createserver.tpl
   - [x] switched Boxes to Form Wizard (jquery.smartWizard.min.js & smart_wizard.min.css)
 - [x] reviewed server.tpl
   - [x] switched default table to DataTables
   - [x] add ability to change checkbox without submit
 - [x] add abilty to remember box-colapse state & sidebar-colapse (adminlte-remember.js)
 - [x] reviewed login.tpl
 - [x] reviewed error.tpl
 - [x] reviewed mainbar.tpl
   - [x] fixed link names while collapsed sidebar
 - [x] reviewed index.tpl
   - [x] added `.no-br` (jQuery function)
   - [x] changed JS/CSS order for specific views, to load only needed files
 - [x] reviewed head.tpl

### ToDO for v1.0.0-rc2
 - [ ] change original DataTables icons (GlyphIcons) to MaterialsDesignIcons
 - [ ] add for almost every box a `collapse`-btn & `data-name`-attribute
 - [ ] add responsive functionality to any DataTable's table
 - [ ] remove self-created fixed header and use DataTable's function

### Next
 - [ ] reviewed filelist.tpl
 - [ ] reviewed channel.tpl
 - [ ] reviewed channeledit.tpl
 - [ ] reviewed channeleditperm.tpl
 - [ ] reviewed channelview.tpl
 - [ ] reviewed createchannel.tpl
 - [ ] reviewed counter.tpl

### ToDo for v1.0.0-rc2
 - [ ] reviewed clients.tpl
   - [x] fixed the responsive table
 - [ ] reviewed cleditperm.tpl
 - [ ] reviewed complainlist.tpl
 - [ ] reviewed chanclienteditperm.tpl
 - [ ] reviewed clientcleaner.tpl
 - [ ] reviewed banlist.tpl
 - [ ] reviewed banadd.tpl
 - [ ] reviewed sgroups.tpl
 - [ ] reviewed sgroupclients.tpl
 - [ ] reviewed sgroupeditperm.tpl
 - [ ] reviewed sgroupadd.tpl
 - [ ] reviewed cgroups.tpl
 - [ ] reviewed cgroupclients.tpl
 - [ ] reviewed cgroupeditperm.tpl
 - [ ] reviewed cgroupadd.tpl
 - [ ] reviewed token.tpl
 - [ ] reviewed backup.tpl
 - [ ] reviewed serverbackup.tpl
 - [ ] reviewed permexport.tpl
 - [ ] reviewed clientsexport.tpl
 - [ ] reviewed bansexport.tpl
 - [ ] reviewed console.tpl
 - [ ] reviewed filebrowser.tpl
 - [ ] reviewed interactive.tpl

### Views [Not in Use]
- hostlogin.tpl
