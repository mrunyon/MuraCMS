<!--- This file is part of Mura CMS.

Mura CMS is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, Version 2 of the License.

Mura CMS is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. ?See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mura CMS. ?If not, see <http://www.gnu.org/licenses/>.

Linking Mura CMS statically or dynamically with other modules constitutes
the preparation of a derivative work based on Mura CMS. Thus, the terms and
conditions of the GNU General Public License version 2 (?GPL?) cover the entire combined work.

However, as a special exception, the copyright holders of Mura CMS grant you permission
to combine Mura CMS with programs or libraries that are released under the GNU Lesser General Public License version 2.1.

In addition, as a special exception, ?the copyright holders of Mura CMS grant you permission
to combine Mura CMS ?with independent software modules that communicate with Mura CMS solely
through modules packaged as Mura CMS plugins and deployed through the Mura CMS plugin installation API,
provided that these modules (a) may only modify the ?/plugins/ directory through the Mura CMS
plugin installation API, (b) must not alter any default objects in the Mura CMS database
and (c) must not alter any files in the following directories except in cases where the code contains
a separately distributed license.

/admin/
/tasks/
/config/
/requirements/mura/

You may copy and distribute such a combined work under the terms of GPL for Mura CMS, provided that you include
the source code of that other code when and as the GNU GPL requires distribution of source code.

For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception
for your modified version; it is your choice whether to do so, or to make such modified version available under
the GNU General Public License version 2 ?without this exception. ?You may, if you choose, apply this exception
to your own modified versions of Mura CMS.
--->
<cfoutput>
<h1 class="page-heading">Mura CMS Setup</h1>

<cfif len( trim( message ) )>
	<p class="alert alert-error">#message#</p>
</cfif>

<div class="js-wizard-simple block">

	<ul class="nav nav-tabs nav-justified">
		<li class="active">
			<a href="##tab-database" data-toggle="tab">1. Database</a>
		</li>
		<li>
			<a href="##tab-admin" data-toggle="tab">2. Admin</a>
		</li>
		<li>
			<a href="##tab-options" data-toggle="tab">3. Options</a>
		</li>
	</ul><!-- /.nav-tabs -->

	<form class="form-horizontal" action="index.cfm" method="post">
		<input type="hidden" name="action" value="doSetup" />

		<!-- Progress Bar -->
		<div class="wizard-progress progress progress-mini">
			<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 0"></div>
		</div>
		<!-- /Progress Bar -->


		<!-- Tab Content -->
		<div class="block-content tab-content">

			<!--- TAB-DATABASE --->
			<div class="tab-pane in active" id="tab-database">
					<p class="alert alert-warning"><strong>Step 1:</strong> select the database type to be used, and provide the datasource connection information.</p> 

					<div class="mura-control-group">
						<label></label>
						<select name	="production_dbtype"
								id		="production_dbtype" >
							<option value="" <cfif !len(trim(FORM.production_dbtype))>selected</cfif>>Select Database Type...</option>
							<option value="mysql" <cfif FORM.production_dbtype IS "mysql">selected</cfif>>MySQL</option>
							<option value="mssql" <cfif FORM.production_dbtype IS "mssql">selected</cfif>>MSSQL</option>
							<option value="nuodb" <cfif FORM.production_dbtype IS "nuodb">selected</cfif>>NuoDB</option>
							<option value="oracle" <cfif FORM.production_dbtype IS "oracle">selected</cfif>>Oracle</option>
							<option value="postgresql" <cfif FORM.production_dbtype IS "postgresql">selected</cfif>>PostgreSQL</option>
							</select>
					</div>

					<div class="mura-control-group database-config" >
						<label class="css-input switch switch-sm switch-primary">
							<input type="checkbox" id="auto_create" name="auto_create" value="1"
							<cfif len(trim(form.auto_create)) and val(form.auto_create)>checked</cfif>
							><span></span> <label class="database-create-no">Use an existing database</label><label class="database-create-yes">Create a new database</label>
						</label>
						<p class="help-block">Use an existing database, or create a new one.</p> 
					</div>

					<div class="mura-control-group database-create-yes">
						<label>#theCFServer# Password</label>
						<input type="password" name="production_cfpassword" value="#FORM.production_cfpassword#" />
						<p class="help-block">Required to create database.</p>
					</div>

					<div class="mura-control-group database-create-yes">
						<label>Database Server</label>
						<input type="text" name="production_databaseserver" value="#FORM.production_databaseserver#" />
					</div>

					<div class="mura-control-group database-create-oracle">
						<label>Oracle Tablespace</label>
						<input type="text" name="production_dbtablespace" value="#FORM.production_dbtablespace#" />
					</div>

					<div class="mura-control-group database-config">
						<label>Datasource Name</label>
						<input type="text" name="production_datasource" value="#FORM.production_datasource#" />
					</div>

					<div class="mura-control-group database-config">
						<label>Database Username</label>
						<input type="text" name="production_dbusername" value="#FORM.production_dbusername#" />
						<p class="help-block database-create-no">Optional if already configured in #theCFServer# admin.</p>
						<p class="help-block database-create-yes">Required to create database.</p>
					</div>

					<div class="mura-control-group database-config">
						<label>Database Password</label>
						<input type="password" name="production_dbpassword" value="#FORM.production_dbpassword#" />
						<p class="help-block database-create-no">Optional if already configured in #theCFServer# admin.</p>
						<p class="help-block database-create-yes">Required to create database.</p>
					</div>

			</div>
			<!--- /TAB-DATABASE --->

			<!-- TAB-ADMIN -->
			<div class="tab-pane" id="tab-admin">

					<p class="alert alert-warning"><strong>Step 2:</strong> enter credentials for the "Super Admin" administrative user account.*</p>


					<div class="mura-control-group">
						<label>Super Admin Username</label>
						<input type="text" name="admin_username" value="#FORM.admin_username#" />
					</div>

					<div class="mura-control-group">
						<label>Super Admin Password</label>
						<input type="text" name="admin_password" value="#FORM.admin_password#" />
					</div>
					<div class="mura-control-group">
						<label>Super Admin Email</label>
						<input type="text" name="production_adminemail" value="#FORM.production_adminemail#" />
					</div>

					<p class="help-block">*This creates a master user account with full access to all Mura features. The password may be changed in the admin area once the site setup is complete. Additional users with various levels of access may also be added from within the Mura CMS admin. Be sure to use a strong, secure password.</p>



			</div>
			<!-- /TAB-ADMIN -->

			<!-- TAB-OPTIONS -->
			<div class="tab-pane" id="tab-options">

					<p class="alert alert-warning"><strong>Step 3:</strong> select whether "index.cfm" and the Site ID should appear in Mura's navigation links (see example below)</p>

					<div class="mura-control-group" >

						<label class="css-input switch switch-sm switch-primary">
							<input type="checkbox" id="production_siteidinurls" name="production_siteidinurls" value="1" class="build-url-example"
							<cfif val(form.production_siteidinurls)>checked</cfif>
							><span></span> <label class="option-siteid-yes">Use SiteID in URLs</label><label class="option-siteid-no">Do not use SiteID in URLs</label>
						</label>

						<label class="css-input switch switch-sm switch-primary">
							<input type="checkbox" id="production_indexfileinurls" name="production_indexfileinurls" value="1" class="build-url-example"
							<cfif val(form.production_indexfileinurls)>checked</cfif>
							><span></span> <label class="option-indexfile-yes">Use "index.cfm" in URLs</label><label class="option-indexfile-no">Do not use "index.cfm" in URLs</label>
						</label>
					</div>

					<p class="help-block">Example:<br><span id="url_example"><#context#/[siteid]/index.cfm?</span></p>

			</div>
			<!-- /TAB-OPTIONS -->

		</div>
		<!-- END Steps Content -->

		<div class="mura-focus-actions center">

					<button class="wizard-prev btn" type="button"><i class="mi mi-arrow-left"></i> Back</button>
					<button class="wizard-next btn" type="button">Next <i class="mi mi-arrow-right"></i></button>
					<button class="wizard-finish btn" name="setupSubmitButton" type="submit"><i class="mi mi-check"></i> Submit</button>
		</div>
		<div class="clear-both"></div>

	</form><!-- END Form -->
</div>
<!-- END Simple Classic Progress Wizard -->

<script src="//cmsadmin.staging.gowesthosting.com/template/assets/js/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
<script src="//cmsadmin.staging.gowesthosting.com/template/assets/js/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="//cmsadmin.staging.gowesthosting.com/template/assets/js/pages/base_forms_wizard.js"></script>
<script type="text/javascript" language="javascript">
dtLocale='';
activetab=1;
activepanel=0;
jQuery(document).ready(function(){

	// show DB options on db type select
	$(".database-config").toggle(#(len(trim(FORM.production_dbtype)) gt 0)#);
	$('##production_dbtype').on('change',function(){
		$(".database-config").toggle(this.value.length > 0);
		$(".database-create-oracle").toggle($('##production_dbtype option:selected').val() == 'oracle' && $('##auto_create').is(':checked'));
	});

	// existing database y/n
	$(".database-create-yes").toggle(#(val(FORM.auto_create) eq 1)#);
	$(".database-create-no").toggle(#(val(FORM.auto_create) eq 0)#);
	$(".database-create-oracle").toggle(#(FORM.production_dbtype eq 'oracle' and val(FORM.auto_create) eq 1)#);
	$('##auto_create').on('change',function(){
		$(".database-create-yes").toggle(this.checked);
		$(".database-create-no").toggle(!this.checked);
		$(".database-create-oracle").toggle($('##production_dbtype option:selected').val() == 'oracle' && $('##auto_create').is(':checked'));
	});

	// siteid and index in urls
  $(".option-siteid-yes").toggle(#(val(FORM.production_siteidinurls) eq 1)#);
  $(".option-siteid-no").toggle(#(val(FORM.production_siteidinurls) eq 0)#);
	$("##production_siteidinurls").on('change',function(){
		$(".option-siteid-yes").toggle(this.checked);
		$(".option-siteid-no").toggle(!this.checked);
	});
  $(".option-indexfile-yes").toggle(#(val(FORM.production_indexfileinurls) eq 1)#);
  $(".option-indexfile-no").toggle(#(val(FORM.production_indexfileinurls) eq 0)#);
	$("##production_indexfileinurls").on('change',function(){
		$(".option-indexfile-yes").toggle(this.checked);
		$(".option-indexfile-no").toggle(!this.checked);
	});

	// example URL
	$('.build-url-example').on('change',function(){
		var ret = 'domain.com#context#';
		if ($("##production_siteidinurls").is(':checked')) {
			ret = ret + '/[siteid]';
		}
		if ($("##production_indexfileinurls").is(':checked')) {
			ret = ret + '/index.cfm';
		}
		ret = ret + '/full-path-to/page-location/';
		$("##url_example").html(ret);
	});
	// show example URL on page load
	$('.build-url-example').change();

});
</script>
</cfoutput>