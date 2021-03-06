import mosspy

userid = 103864993

m = mosspy.Moss(userid, "java")

#m.addBaseFile("submission/a01.py")
#m.addBaseFile("submission/test_student.py")

# Submission Files
#m.addFile("submission/a01-sample.py")

m.addFilesByWildcard("submission/*/*/*/*/*.pde")
m.addFilesByWildcard("submission/*/*/*/*.pde")
m.addFilesByWildcard("submission/*/*/*.pde")
m.addFilesByWildcard("submission/*/*.pde")

# progress function optional, run on every file uploaded
# result is submission URL
url = m.send(lambda file_path, display_name: print('*', end='', flush=True))
print()

print ("Report URL: " + url)

# Save report file
m.saveWebPage(url, "submission/report.html")

mosspy.download_report(url, "submission/report/", connections=8, log_level=10, on_read=lambda url: print('*', end='', flush=True)) 
# log_level=logging.DEBUG (20 to disable)
# on_read function run for every downloaded file