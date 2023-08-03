import os
import time
import sys
import glob
from importlib import import_module
from importlib.machinery import SourceFileLoader

mapping_util = SourceFileLoader('mapping_util', os.path.dirname(os.path.realpath(__file__)) + '/mapping_util.py').load_module()
db_conf = import_module('__postgres_db_conf', os.getcwd() + '\\__postgres_db_conf.py').db_conf
log = import_module('write_log', os.getcwd() + '\\write_log.py').Log('5_build_cdm_pk_idx_fk')

# ---------------------------------------------------------
def build_fk(dir_code): 
# Build FK in parallel when possible
# ---------------------------------------------------------
	ret = True

	try:
		processed_folder = dir_code + "processed\\"
		if not os.path.exists(processed_folder):
			os.makedirs(processed_folder)
		plist = []
		plist.append(dir_code + "5b_cdm_fk_care_site__concept.sql")
		plist.append(dir_code + "5b_cdm_fk_person__provider.sql")
		ret = mapping_util.execute_sql_files_parallel(plist, True)
		if ret == True:
			plist.clear()
			plist.append(dir_code + "5b_cdm_fk_care_site__location.sql")
			plist.append(dir_code + "5b_cdm_fk_provider__concept.sql")
			plist.append(dir_code + "5b_cdm_fk_observation_period__person.sql")
			ret = mapping_util.execute_sql_files_parallel(plist, True)
		if ret == True:
			plist.clear()
			plist.append(dir_code + "5b_cdm_fk_person__location.sql")
			plist.append(dir_code + "5b_cdm_fk_provider__care_site.sql")
			plist.append(dir_code + "5b_cdm_fk_observation_period__concept.sql")
			ret = mapping_util.execute_sql_files_parallel(plist, True)
		if ret == True:
			fname = dir_code + "5b_cdm_fk_person__care_site.sql"
			ret = mapping_util.execute_multiple_queries(fname, None, None, True, True)
		if ret == True:
			fname = dir_code + "5b_cdm_fk_visit_occurrence__care_site.sql"
			ret = mapping_util.execute_multiple_queries(fname, None, None, True, True)
		if ret == True:
			plist.clear()
			plist.append(dir_code + "5b_cdm_fk_person__concept.sql")
			plist.append(dir_code + "5b_cdm_fk_visit_detail__care_site.sql")
			ret = mapping_util.execute_sql_files_parallel(plist, True)
		if ret == True:
			sql_file_list = sorted(glob.iglob(dir_code + '5b_cdm_fk_*.sql'))
			list1 = ['condition_occurrence','device_exposure','drug_exposure','measurement','observation','procedure_occurrence','visit_detail','visit_occurrence']
			list2 = ['concept','person','provider','visit_detail','visit_occurrence']
			for i in range(len(list1)):
				plist.clear()
				for j in range(len(list2)):
					fname = dir_code + "5b_cdm_fk_" + list1[j] + "__" + list2[j] + ".sql"
					if fname in sql_file_list:
						plist.append(fname)
				if plist != []:
					ret = mapping_util.execute_sql_files_parallel(plist, True)
					if ret == False:
						break
					plist.clear()
				list1.append(list1.pop(0))
	except:
		ret = False
		err = sys.exc_info()
		print("Function = {0}, Error = {1}, {2}".format("build_fk", err[0], err[1]))
	return(ret)	

# ---------------------------------------------------------
# MAIN PROGRAM
# ---------------------------------------------------------
def main():
	ret = True
	
	try:
		time0 = time.time()
		study_directory = db_conf['dir_study']
		dir_code = study_directory + "code\\sql_scripts\\"
# ---------------------------------------------------------
# Build PKs & IDXs
# ---------------------------------------------------------
		pk_idx_tbls = input('Are you sure you want to CREATE PK/IDX on all cdm tables (y/n):') 
		while pk_idx_tbls.lower() not in ['y', 'n', 'yes', 'no']:
			pk_idx_tbls = input('I did not understand that. Are you sure you want to CREATE PK/IDX on all cdm tables (y/n):') 
		if pk_idx_tbls.lower() in ['y', 'yes']:
			log.log_message('Build PKs and IDXs ...')
			sql_file_list = sorted(glob.iglob(dir_code + '5a_cdm_pk_idx_*.sql'))
			ret = mapping_util.execute_sql_files_parallel(sql_file_list, True)
		if ret == True:
# ---------------------------------------------------------
# Build FK
# ---------------------------------------------------------
			fk_tbls = input('Are you sure you want to CREATE FK on all cdm tables (y/n):') 
			while fk_tbls.lower() not in ['y', 'n', 'yes', 'no']:
				fk_tbls = input('I did not understand that. Are you sure you want to CREATE FK on all cdm tables (y/n):') 
			if fk_tbls.lower() in ['y', 'yes']:
				log.log_message('Build FKs ...')
				ret = build_fk(dir_code)
				if ret == True:
					log.log_message('Finished building FK')	
# ---------------------------------------------------------
# Report total time
# ---------------------------------------------------------
		if ret == True:
			process_finished = "{0} completed in {1}".format(os.path.basename(__file__), mapping_util.calc_time(time.time() - time0))
			log.log_message(process_finished)
	except:
		log.log_message(str(sys.exc_info()[1]))

# ---------------------------------------------------------
# Protect entry point
# ---------------------------------------------------------
if __name__ == "__main__":
	main()
	