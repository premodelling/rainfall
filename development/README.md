<br>

### Independent Development Environments

**IntelliJ**

* Edit the help file skeletons in 'man', possibly combining help files
  for multiple functions.
* Edit the exports in 'NAMESPACE', and add necessary imports.
* Put any C/C++/Fortran code in 'src'.
* If you have compiled code, add a useDynLib() directive to
  'NAMESPACE'.
* Run R CMD build to build the package tarball.
* Run R CMD check to check the package tarball.

Read "Writing R Extensions" for more information.


**R Studio**

Open this project via rainfall.Rproj

<br>
<br>

### Snippets

**Ordering**
```R
dataframe %>%
  arrange(fieldname)
```
or
```
dataframe[order(dataframe$fieldname), ]
```

<br>

**Extracting parts of a date**
```
# extract month code
format(dataframe$date, format = '%m')
```

<br>
<br>
<br>
<br>