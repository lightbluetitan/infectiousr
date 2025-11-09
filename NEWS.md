# infectiousR 0.1.2

## CRAN Resubmission

* Increased version number from 0.1.1 to 0.1.2 to comply with CRAN “Insufficient package version” policy.
* No functional changes — this submission only updates metadata to satisfy CRAN submission requirements.
* Verified package passes all checks with `R CMD check --as-cran` (0 errors, 0 warnings, 0 notes).

# infectiousR 0.1.1

## Bug Fixes

* Fixed graceful failure handling for all API functions when internet is unavailable
* Functions now use `message()` instead of `warning()` for connection errors
* Added timeout (10 seconds) to all API requests to prevent hanging
* Improved error messages to be more informative for users
* All functions now return `NULL` gracefully when API is unavailable
* Updated documentation to reflect graceful failure behavior
* Changed examples from `\donttest{}` to `\dontrun{}` for better CRAN compliance

## CRAN Compliance

* Package now complies with CRAN policy: "Packages which use Internet resources should fail gracefully with an informative message if the resource is not available"

# infectiousR 0.1.0

* Initial CRAN release
