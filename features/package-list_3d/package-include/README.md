# openjdk-17-jre stub package for visicut on Debian 13 (trixie)

Temporary solution for current visicut (2.1-19-g511a28e8, 2025-10-26)
explicitly depending on old java runtime versions.. Resulting error:

    Some packages could not be installed. This may mean that you have
    requested an impossible situation or if you are using the unstable
    distribution that some required packages have not yet been created
    or been moved out of Incoming.
    The following information may help to resolve the situation:

    Unsatisfied dependencies:
     visicut : Depends: openjdk-11-jre but it is not installable or
                        openjdk-17-jre but it is not installable
    Error: Unable to correct problems, you have held broken packages.
    Error: The following information from --solver 3.0 may provide additional context:
       Unable to satisfy dependencies. Reached two conflicting decisions:
       1. visicut:amd64=2.1-19-g511a28e8-1 is selected for install
       2. visicut:amd64 Depends openjdk-11-jre | openjdk-17-jre
          but none of the choices are installable:
          [no choices]

# Build

> equivs-build openjdk-17-jre-stub.ctl
