#
#
# Temporarily all 4 sections, Policy, Site/Cluster, Team, User
# are in this file to provide all-in-one visibility 
# during the development phase.
#
. ${opBase}/lib/opPathLib.sh
. ${opBase}/lib/ocp-general.sh

bisosBase="/bisos"

#
# MMA SPECIFICATIONS
#  ../../sysConfigInput/profiles/shProfile-mma.general
#  

typeset mainDrive="c"
typeset cygwin_mainDrive="/cygdrive/${mainDrive}"

typeset nDrive="n"
typeset cygwin_nDrive="/cygdrive/${nDrive}"

function aProf_path_bisos {
  opBasePathSet
}

# function aProf_bsip_bisos {
#     # /bisos/core/bsip/bin
#     export PATH="${bisosBase}/core/bsip/bin:${PATH}"
# }

# function aProf_venvPy3Dev_bisos {
#     # /bisos/venv/py3/dev/bisos3/bin
#     export PATH="${bisosBase}/venv/py3/dev/bisos3/bin:${PATH}"
# }

# function aProf_venvPy3_bisos {
#     # /bisos/venv/py3/bisos3/bin
#     export PATH="${bisosBase}/venv/py3/bisos3/bin:${PATH}"
# }

# function aProf_venvPy2Dev_bisos {
#     # /bisos/venv/py2/dev/bisos3/bin
#     export PATH="${bisosBase}/venv/py2/dev/bisos3/bin:${PATH}"
# }

# function aProf_venvPy2_bisos {
#     # /bisos/venv/py2/bisos3/bin
#     export PATH="${bisosBase}/venv/py2/bisos3/bin:${PATH}"
# }



function aProf_basePath_mma {
  case ${opRunOsType} in
    'SunOS')
      export PATH="/usr/bin"
      export PATH="/bin:${PATH}"
      export PATH="/usr/sbin:${PATH}"
      export PATH="/usr/ccs/bin:${PATH}"
      export PATH="/usr/5bin:${PATH}"

      export MANPATH=/usr/man

      export INFOPATH=""
      ;;
    'Linux')
      export PATH="/bin"
      export PATH="/usr/bin:${PATH}"		
      export PATH="${PATH}:/usr/games"
      export PATH="${PATH}:/sbin"
      export PATH="${PATH}:/usr/sbin"
      export PATH="${PATH}:/usr/local/sbin"

      export MANPATH=/usr/share/man:/usr/man

      export INFOPATH=""
      ;;
    'Windows_NT' | 'UWIN-NT')
      export PATH="/bin:/usr/local/bin:/usr/bin:/usr/games:/sbin:/usr/sbin:/usr/local/sbin:/sys:/win"
      ;;
    CYGWIN_NT-*)
      export PATH="/bin:/usr/local/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/sbin:/usr/i686-pc-cygwin/bin"
      export SHELL=/bin/bash.exe
      ;;
    *)
      EH_problem "$0 not Suported on ${opRunOsType}"
      ;;	
  esac
}

function aProf_ucbFeatures_mma {
  # Should come last
  case ${opRunOsType} in
    'SunOS')
      export PATH="${PATH}:/usr/ucb"
      ;;
    'Linux')
      doNothing	     
      ;;
    'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
      doNothing
      ;;
    *)
      EH_problem "$0 not Suported on ${opRunOsType}"
      ;;	
  esac
}


function aProf_ucbFeatures_mma {
  # Should come last
  case ${opRunOsType} in
    'SunOS')
      export PATH="${PATH}:/usr/ucb"
      ;;
    'Linux')
      doNothing	     
      ;;
    'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
      doNothing
      ;;
    *)
      EH_problem "$0 not Suported on ${opRunOsType}"
      ;;	
  esac
}


function aProf_cvs_mma {
  case ${opRunOsType} in
    'SunOS' |  'Linux')
      export CVSROOT=/usr/release    
      ;;
    'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
      doNothing    
      ;;
    *)
      EH_problem "$0 not Suported on ${opRunOsType}"
      ;;
  esac
}

function aProf_osmt_mma {
  case ${opRunOsType} in
    'SunOS' |  'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
      export OSMTROOT=/opt/public/osmt
      # /opt/public/osmt/usrEnv
      export PATH=${OSMTROOT}/bin:${OSMTROOT}/usrEnv:$PATH
      export PATH=${OSMTROOT}/nedaBin:$PATH
      #export PATH="/libre/site/bin":$PATH
      export PATH="/private/site/bin":$PATH	

      export MOZ_NO_REMOTE=1    # -no-remote	
      # NOTYET, MANPATH
      ;;
    *)
      EH_problem "$0 not Suported on ${opRunOsType}"
      ;;
  esac
}

function aProf_gnats_mma {
  case ${opRunOsType} in
    'SunOS' |  'Linux')
      #export GNATSROOT=/opt/public/mma/gnats
      export PATH=/opt/public/mma/gnats/bin:$PATH

      # NOTYET, MANPATH
      ;;
    'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
      doNothing
      ;;
    *)
      EH_problem "$0 not Suported on ${opRunOsType}"
      ;;
  esac
}


function aProf_qmail_mma {
  case ${opRunOsType} in
    'SunOS' |  'Linux')
      # /var/qmail/man
      export MANPATH=$MANPATH:/var/qmail/man
      ;;
    'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
      doNothing
      ;;
    *)
      EH_problem "$0 not Suported on ${opRunOsType}"
      ;;
  esac
}


function aProf_ezmlm_mma {
  case ${opRunOsType} in
    'SunOS' |  'Linux')
      # /opt/public/mma/ezmlm/man/
      export MANPATH=$MANPATH:/opt/public/mma/ezmlm/man
      ;;
    'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
      doNothing
      ;;
    *)
      EH_problem "$0 not Suported on ${opRunOsType}"
      ;;
  esac
}


function aProf_java_mma {
  case ${opRunOsType} in
    'SunOS' |  'Linux')

      if [[ -d 	/usr/local/j2sdk ]] ; then		
        export JAVA_HOME=/usr/local/j2sdk

	export CLASSPATH=""
	typeset pathList=`find ${JAVA_HOME}/lib ${JAVA_HOME}/jre/lib -name '*.jar' -print`
	opPathSetList CLASSPATH "${pathList}"
	opPathAppend CLASSPATH "."

	export PATH=${JAVA_HOME}/bin:$PATH
	export MANPATH=${JAVA_HOME}/man:$MANPATH
      else
	doNothing
	#ANT_raw "JAVA_HOME not set to /usr/local/j2sdk"
      fi

      export J2ME_HOME=/usr/local/packages/j2mewtk
      export ANT_HOME=/opt/public/mmaJava/jakarta-ant-1.5
      #export TOMCAT_HOME=/opt/public/mmaJava/byname-tomcat-4.0.3
      ;;
    'Windows_NT')
      export JAVA_HOME=${mainDrive}:\\jdk1.3.1_02
      export J2ME_HOME=${mainDrive}:\\J2mewtk
      export ANT_HOME=${mainDrive}:\\jakarta-ant-1.4.1

      export PATH=${JAVA_HOME}\\bin;$PATH
      export MANPATH=${JAVA_HOME}\\man;$MANPATH
      ;;
    'UWIN-NT')
      export JAVA_HOME=${mainDrive}:\\jdk1.3.1_02
      export J2ME_HOME=${mainDrive}:\\J2mewtk
      export ANT_HOME=${mainDrive}:\\jakarta-ant-1.4.1

      export PATH=/${mainDrive}/jdk1.3.1_02/bin:$PATH
      export MANPATH=/${mainDrive}/jdk1.3.1_02/man:$MANPATH
      ;;
    CYGWIN_NT-*)
      export JAVA_HOME=${mainDrive}:\\jdk1.3.1_02
      export J2ME_HOME=${mainDrive}:\\J2mewtk
      export ANT_HOME=${mainDrive}:\\jakarta-ant-1.4.1

      export PATH=${cygwin_mainDrive}/jdk1.3.1_02/bin:$PATH
      export MANPATH=${cygwin_mainDrive}/jdk1.3.1_02/man:$MANPATH
      ;;
    *)
      EH_problem "$0 not Suported on ${opRunOsType}"
      ;;
  esac
}

function aProf_mmaBase_mma {
  case ${opRunOsType} in
    'SunOS' |  'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
      export PATH=/opt/public/mma/bin:$PATH
      export MANPATH=/opt/public/mma/man:$MANPATH
	
      ;;
    *)
      EH_problem "$0 not Suported on ${opRunOsType}"
      ;;
  esac
}



#
#  SITE SPECIFICATIONS
#
#  ./shProfile-employee.site
#

function aProf_curenv_site {
  case ${opRunClusterName} in
    'office' |  'dmz' | 'subscriber' | 'genericCluster' | 'pub2')
      case ${opRunOsType} in
	'SunOS' |  'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
           export PATH="/usr/curenv/bin:${PATH}"
	   export MANPATH=$MANPATH:/usr/curenv/man	
	   ;;
	*)
	   EH_problem "$0 not Suported on ${opRunOsType}"
	   ;;
      esac
      ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}

function aProf_devenv_site {
  case ${opRunOsType} in
    'SunOS' |  'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
       export PATH="/usr/devenv/bin:${PATH}"
       export MANPATH=$MANPATH:/usr/devenv/man	
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}


function aProf_local_site {
 case ${opRunOsType} in
    'SunOS' |  'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
       export PATH="/usr/local/bin:${PATH}"
       export MANPATH=$MANPATH:/usr/local/man
       opPathAppend LD_LIBRARY_PATH /usr/local/lib
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}

function aProf_frameMaker_site {
 case ${opRunOsType} in
    'SunOS')
       export PATH="/opt/local/frame5/bin:${PATH}"
       ;;
    CYGWIN_NT-*)
       export MAKER=${mainDrive}:\\MAKER5\\FRAME.EXE
       export PATH="${cygwin_mainDrive}/MAKER5:${PATH}"
       ;;
    'Windows_NT' | 'UWIN-NT')
       export maker=${mainDrive}:\MAKER5\FRAME.EXE
       export PATH="${mainDrive}\MAKER5:${PATH}"
       ;;
    'Linux')
       doNothing
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}

function aProf_acrobat_site {
 case ${opRunOsType} in
    'SunOS')
       export PATH="/opt/local/Acrobat3/bin:${PATH}"
       ;;
    CYGWIN_NT-*)
       export PATH="${cygwin_mainDrive}/Adobe/AcrobatReader40/Reader:${PATH}"
       ;;
    'Linux' | 'Windows_NT' | 'UWIN-NT')
       doNothing
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}

function aProf_tex_site {
 case ${opRunOsType} in
    'SunOS')
       PATH="/opt/public/teTeX/bin/sparc-solaris:${PATH}"
       export MANPATH=$MANPATH:/opt/public/teTex/man	
       export INFOPATH=/opt/public/teTeX/info	
       ;;
    CYGWIN_NT-*)
       PATH="${cygwin_mainDrive}/texmf/miktex/bin:${cygwin_mainDrive}/texmf/l2h/bin:${PATH}"
       ;;
    'Linux' | 'Windows_NT' | 'UWIN-NT')
       doNothing
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}

function aProf_networking_site {
 case ${opRunOsType} in
    'SunOS')
       doNothing
       ;;
    'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
       doNothing
       ;;
    *)
       EH_problem "NOTYET"
       PATH="/opt/public/networking/mma/ezmlm/bin:${PATH}"
       export MANPATH=$MANPATH:/opt/public/networking/mma/ezmlm/man
       PATH="/opt/public/networking/bin:${PATH}"
       export MANPATH=$MANPATH:/opt/public/networking/man
       PATH="/opt/public/networking/fax/bin:${PATH}"
       export MANPATH=$MANPATH:/opt/public/networking/fax/man
       PATH="/opt/public/networking/qi/bin:${PATH}"
       PATH="/usr/public/networking/bin:${PATH}"
       export MANPATH=$MANPATH:/usr/public/networking/man

       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}


function aProf_foundation_site {
 case ${opRunOsType} in
    'SunOS')
       PATH="/opt/public/foundation/bin:${PATH}"
       export MANPATH=$MANPATH:/opt/public/foundation/man
       PATH="/usr/public/foundation/bin:${PATH}"
       PATH="/usr/public/bin:${PATH}"
       export MANPATH=$MANPATH:/usr/public/foundation/man
       ;;
    'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
       doNothing
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}


function aProf_openwin_site {
 case ${opRunOsType} in
    'SunOS')
       PATH="/usr/openwin/bin:${PATH}"
       opPathAppend LD_LIBRARY_PATH /usr/openwin/lib
       ;;
    'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
       doNothing
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}

function aProf_x11_site {
  aProf_x11R4_site
  aProf_x11R6_site
}

function aProf_x11R4_site {
 case ${opRunOsType} in
    'SunOS')
       PATH="/usr/public/x11r4/bin:${PATH}"
       export MANPATH=$MANPATH:/usr/public/x11r4/man
       opPathAppend LD_LIBRARY_PATH /usr/openwin/lib
       ;;
    'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
       doNothing
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}

function aProf_x11R6_site {
 case ${opRunOsType} in
    'SunOS')
       doNothing
       ;;
    CYGWIN_NT-*)
       export PATH="/usr/X11R6/bin:${PATH}"
       ;;
    'Windows_NT' | 'UWIN-NT')
       export PATH="/usr/bin/X11:${PATH}"
       export MANPATH=/usr/X11R6/man:${MANPATH}
       ;;
    'Linux')
       export PATH="/usr/X11R6/bin:${PATH}"
       export MANPATH=/usr/X11R6/man:${MANPATH}
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}

function aProf_eoe_site {
 case ${opRunOsType} in
    'SunOS')
       PATH="/opt/public/eoe/bin:${PATH}"
       ;;
    'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
       doNothing
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}

function aProf_sde_site {
 case ${opRunOsType} in
    'SunOS')
       PATH="/usr/public/sde/bin:${PATH}"
       PATH="/opt/sfw/bin:${PATH}"
       ;;
    'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
       doNothing
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}


function aProf_sw_site {
 case ${opRunOsType} in
    'SunOS')
       PATH="/neda/sw.a3/curenv.sol2/results/arch/sun4/bin:${PATH}"
       PATH="/neda/sw.a3/curenv.sol2/results/bin:${PATH}"
       export CURENVBASE=/neda/sw.a3/curenv.sol2
       ;;
    'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
       doNothing
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}

function aProf_misc_site {
 case ${opRunOsType} in
    'SunOS')
       PATH="/usr/dt/bin:${PATH}"
       export MANPATH=$MANPATH:/usr/dt/man
       ;;
    'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
       doNothing
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}

function nedaWinConfigs {
  DevStudioPath=${cygwin_mainDrive}/ProgramFiles/MicrosoftVisualStudio
  #DevStudioPath=${cygwin_mainDrive}/DevStudio60
}

function aProf_swDev_site {
 case ${opRunOsType} in
    'SunOS' | 'Linux')
       doNothing
       ;;
    CYGWIN_NT-*)
       nedaWinConfigs
       export DEVSTUDIOPATH="${DevStudioPath}"
       export WINCESDKPATH="${DEVSTUDIOPATH}/WCE"
       #export OPUSPATH="${cygwin_nDrive}/opus610/nt"
       export DialogicBase="`cygpath -m ${cygwin_mainDrive}/Dialogic`"
       export ISHIELDPATH="${cygwin_nDrive}/IShield3.32/PROGRAM"
       export INSTRC="${cygwin_nDrive}/IShield3.32/DIALOGS/INCLUDE"
       MSDevDir_cygwin=${DEVSTUDIOPATH}/Common/MSDev98
       export MSDevDir="`cygpath -w ${MSDevDir_cygwin}`"
       MSShared_cygwin=${DEVSTUDIOPATH}/SharedIDE
       export MSShared="`cygpath -w ${MSShared_cygwin}`"
       export CYGWIN_PATH="${cygwin_mainDrive}/cygwin/bin"
       VSCommonDir=${DEVSTUDIOPATH}/Common
       MSVCDir=${DEVSTUDIOPATH}/VC98
       VcOsDir=WINNT
       export PATH="${OPUSPATH}:${ISHIELDPATH}:${MSDevDir_cygwin}/Bin:${MSVCDir}/BIN:${VSCommonDir}/TOOLS/${VcOsDir}:${VSCommonDir}/TOOLS:${MSShared_cygwin}:${PATH}"
       export lib="`cygpath -w ${MSVCDir}/LIB`"
       export lib=${lib}';'"`cygpath -w ${MSVCDir}/MFC/LIB`"

       export include="`cygpath -w ${MSVCDir}/ATL/INCLUDE`"
       export include=${include}';'"`cygpath -w ${MSVCDir}/INCLUDE`"
       export include=${include}';'"`cygpath -w ${MSVCDir}/MFC/INCLUDE`"
       ;;
    'UWIN-NT')
       export DEVSTUDIOPATH="${mainDrive}/DevStudio60"
       export WINCESDKPATH="${mainDrive}/DevStudio60/WCE"
       export PERLPATH="${mainDrive}/perl/bin"
       export OPUSPATH="${nDrive}/opus610/nt"
       export DialogicBase="${mainDrive}/Dialogic"
       export ISHIELDPATH="${nDrive}/IShield3.32/PROGRAM"
       export INSTRC="${nDrive}/IShield3.32/DIALOGS/INCLUDE"
       export MSDevDir="`winpath ${DEVSTUDIOPATH}/SharedIDE`"
       export UWIN_PATH="${mainDrive}/UWIN/usr/bin"
       VSCommonDir=${DEVSTUDIOPATH}/Common
       MSVCDir=${DEVSTUDIOPATH}/VC98
       VcOsDir=WINNT
       export PATH="${PATH}:${OPUSPATH}:${PERLPATH}:${ISHIELDPATH}:${MSDevDir}/BIN:${MSVCDir}/BIN:${VSCommonDir}/TOOLS/${VcOsDir}:${VSCommonDir}/TOOLS"
       export lib="`winpath ${MSVCDir}/LIB:${MSVCDir}/MFC/LIB:${LIB}`"
       export include="`winpath ${MSVCDir}/ATL/INCLUDE:${MSVCDir}/INCLUDE:${MSVCDir}/MFC/INCLUDE:${INCLUDE}`"
       ;;
    'Windows_NT')
       export DEVSTUDIOPATH="${mainDrive}:\\DevStudio60"
       export WINCESDKPATH="${mainDrive}:\\DevStudio60\\WCE"
       export PERLPATH="${mainDrive}:\\perl\\bin"
       export OPUSPATH="${nDrive}:\\opus610\\nt"
       export DialogicBase="${mainDrive}:\\Dialogic"
       export ISHIELDPATH="${nDrive}:\\IShield3.32\\PROGRAM"
       export INSTRC="${nDrive}:\\IShield3.32\\DIALOGS\\INCLUDE"
       export MSDevDir="${DEVSTUDIOPATH}\\SharedIDE"
       export PATH="${PATH};${OPUSPATH};${PERLPATH};${ISHIELDPATH};${MSDevDir}\\BIN;${MSVCDir}\\BIN;${VSCommonDir}\\TOOLS\\${VcOsDir};${VSCommonDir}\\TOOLS"
       export lib="${MSVCDir}\\LIB;${MSVCDir}\\MFC\\LIB;${LIB}"
       export include="${MSVCDir}\\ATL\\INCLUDE;${MSVCDir}\\INCLUDE;${MSVCDir}\\MFC\\INCLUDE;${INCLUDE}"
       ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}


function aProf_printer_site {
  case ${opRunClusterName} in
    'office')
      case ${opRunOsType} in
	'SunOS' |  'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
	   if [ -f /etc/printcap ] ; then
              export LPDEST=lpr1 	 
  	      else
              export LPDEST=hp8000 	 
	      fi
	   ;;
	*)
	   EH_problem "$0 not Suported on ${opRunOsType}"
	   ;;
      esac
      ;;
    'dmz' | 'subscriber' | 'genericCluster' | 'pub2')
      export LPDEST=noPrinter 
      ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
       ;;
  esac
}


#
#  TEAM SPECIFICATIONS
#
#  ./teamName/shProfile-employee.site
#


#
#  USER SPECIFICATIONS
#
#  ~/acctBase/nedaPlus/shProfile-employee.site
#


function aProf_tex_user {
  #print ${allClusters}
  case ${opRunClusterName} in
    'office' |  'dmz' | 'subscriber' | 'genericCluster' | 'pub2')
      case ${opRunOsType} in
	'SunOS' |  'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
	   doNothing					       
	   ;;
	*)
	   EH_problem "$0 not Suported on ${opRunOsType}"
      esac
      ;;
    *)
       EH_problem "$0 not Suported on ${opRunClusterName}"
  esac
}

function aProf_osmt_user {
  case ${opRunClusterName} in
    'office' |  'dmz' | 'subscriber' | 'genericCluster' | 'pub2')
      case ${opRunOsType} in
	'SunOS' |  'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
          #export OSMTROOT=~/osmt
          #export PATH=${OSMTROOT}/bin:$PATH
          doNothing						       
	   ;;
	*)
	   EH_problem "$0 not Suported on ${opRunOsType}"
      esac
      ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
  esac
}

function aProf_printer_user {
  case ${opRunClusterName} in
    'office' |  'dmz' | 'subscriber' | 'genericCluster'  | 'pub2')
      case ${opRunOsType} in
	'SunOS' |  'Linux' | 'Windows_NT' | 'UWIN-NT' | CYGWIN_NT-*)
           export LPDEST=lpr1 
	   ;;
	*)
	   EH_problem "$0 not Suported on ${opRunOsType}"
      esac
      ;;
    'dmz' | 'subscriber')
      export LPDEST=noPrinter 
      ;;
    *)
       EH_problem "$0 not Suported on ${opRunOsType}"
  esac
}


