#!/bin/bash

rm setparameters.inp

CR_sigma=0.387541
HCMM_sigma=0.235197
HOCO_sigma=0.040001
HOR_sigma=0.040001
OR_sigma=0.315378
O2CM_sigma=0.302905
PO4_sigma=0.383086
HOH_sigma=0.040001
OH2_sigma=0.315057


CR_epsilon=0.230120
HCMM_epsilon=0.092048
HOCO_epsilon=0.192464
HOR_epsilon=0.192464
OR_epsilon=0.636386
O2CM_epsilon=0.502080
PO4_epsilon=2.447640
HOH_epsilon=0.192464
OH2_epsilon=0.636386


YA_epsilon=0.0000013298
YO_epsilon=0.1554
YS_epsilon=0.1554
OT_epsilon=0.1554

YA_sigma=`echo "scale=10; 4.7943/1.12246" | bc`
YO_sigma=`echo "scale=10; 3.5532/1.12246" | bc`
YS_sigma=`echo "scale=10; 3.5532/1.12246" | bc`
OT_sigma=`echo "scale=10; 3.5532/1.12246" | bc`


YA_YO_sigma=`echo "scale=10; ($YA_sigma+$YO_sigma)/2" | bc`
YA_YS_sigma=`echo "scale=10; ($YA_sigma+$YS_sigma)/2" | bc`
YO_YS_sigma=`echo "scale=10; ($YO_sigma+$YS_sigma)/2" | bc`
YO_OT_sigma=`echo "scale=10; ($YO_sigma+$OT_sigma)/2" | bc`
YA_OT_sigma=`echo "scale=10; ($YA_sigma+$OT_sigma)/2" | bc`
YS_OT_sigma=`echo "scale=10; ($YS_sigma+$OT_sigma)/2" | bc`


YA_YO_epsilon=`echo "scale=10; sqrt($YA_epsilon*$YO_epsilon)" | bc`
YA_YS_epsilon=`echo "scale=10; sqrt($YA_epsilon*$YS_epsilon)" | bc`
YA_OT_epsilon=`echo "scale=10; sqrt($YA_epsilon*$OT_epsilon)" | bc`
YO_YS_epsilon=`echo "scale=10; sqrt($YO_epsilon*$YS_epsilon)" | bc`
YO_OT_epsilon=`echo "scale=10; sqrt($YO_epsilon*$OT_epsilon)" | bc`
YS_OT_epsilon=`echo "scale=10; sqrt($YS_epsilon*$OT_epsilon)" | bc`


CR_HT_sigma=`echo "scale=10; ($CR_sigma+$HOH_sigma)/2" | bc`
HCMM_HT_sigma=`echo "scale=10; ($HCMM_sigma+$HOH_sigma)/2" | bc`
HOCO_HT_sigma=`echo "scale=10; ($HOCO_sigma+$HOH_sigma)/2" | bc`
HOR_HT_sigma=`echo "scale=10; ($HOR_sigma+$HOH_sigma)/2" | bc`
OR_HT_sigma=`echo "scale=10; ($OR_sigma+$HOH_sigma)/2" | bc`
O2CM_HT_sigma=`echo "scale=10; ($O2CM_sigma+$HOH_sigma)/2" | bc`
PO4_HT_sigma=`echo "scale=10; ($PO4_sigma+$HOH_sigma)/2" | bc`


CR_OT_sigma=`echo "scale=10; ($CR_sigma+$OH2_sigma)/2" | bc`
HCMM_OT_sigma=`echo "scale=10; ($HCMM_sigma+$OH2_sigma)/2" | bc`
HOCO_OT_sigma=`echo "scale=10; ($HOCO_sigma+$OH2_sigma)/2" | bc`
HOR_OT_sigma=`echo "scale=10; ($HOR_sigma+$OH2_sigma)/2" | bc`
OR_OT_sigma=`echo "scale=10; ($OR_sigma+$OH2_sigma)/2" | bc`
O2CM_OT_sigma=`echo "scale=10; ($O2CM_sigma+$OH2_sigma)/2" | bc`
PO4_OT_sigma=`echo "scale=10; ($PO4_sigma+$OH2_sigma)/2" | bc`

CR_HT_epsilon=`echo "scale=10; sqrt($CR_epsilon*$HOH_epsilon)" | bc`
HCMM_HT_epsilon=`echo "scale=10; sqrt($HCMM_epsilon*$HOH_epsilon)" | bc`
HOCO_HT_epsilon=`echo "scale=10; sqrt($HOCO_epsilon*$HOH_epsilon)" | bc`
HOR_HT_epsilon=`echo "scale=10; sqrt($HOR_epsilon*$HOH_epsilon)" | bc`
OR_HT_epsilon=`echo "scale=10; sqrt($OR_epsilon*$HOH_epsilon)" | bc`
O2CM_HT_epsilon=`echo "scale=10; sqrt($O2CM_epsilon*$HOH_epsilon)" | bc`
PO4_HT_epsilon=`echo "scale=10; sqrt($PO4_epsilon*$HOH_epsilon)" | bc`


CR_OT_epsilon=`echo "scale=10; sqrt($CR_epsilon*$OH2_epsilon)" | bc`
HCMM_OT_epsilon=`echo "scale=10; sqrt($HCMM_epsilon*$OH2_epsilon)" | bc`
HOCO_OT_epsilon=`echo "scale=10; sqrt($HOCO_epsilon*$OH2_epsilon)" | bc`
HOR_OT_epsilon=`echo "scale=10; sqrt($HOR_epsilon*$OH2_epsilon)" | bc`
OR_OT_epsilon=`echo "scale=10; sqrt($OR_epsilon*$OH2_epsilon)" | bc`
O2CM_OT_epsilon=`echo "scale=10; sqrt($O2CM_epsilon*$OH2_epsilon)" | bc`
PO4_OT_epsilon=`echo "scale=10; sqrt($PO4_epsilon*$OH2_epsilon)" | bc`

# diaspore- gp

CR_YA_epsilon=`echo "scale=10; sqrt($CR_epsilon*$YA_epsilon*4.184)" | bc`
HCMM_YA_epsilon=`echo "scale=10; sqrt($HCMM_epsilon*$YA_epsilon*4.184)" | bc`
HOCO_YA_epsilon=`echo "scale=10; sqrt($HOCO_epsilon*$YA_epsilon*4.184)" | bc`
HOR_YA_epsilon=`echo "scale=10; sqrt($HOR_epsilon*$YA_epsilon*4.184)" | bc`
OR_YA_epsilon=`echo "scale=10; sqrt($OR_epsilon*$YA_epsilon*4.184)" | bc`
O2CM_YA_epsilon=`echo "scale=10; sqrt($O2CM_epsilon*$YA_epsilon*4.184)" | bc`
PO4_YA_epsilon=`echo "scale=10; sqrt($PO4_epsilon*$YA_epsilon*4.184)" | bc`

CR_YO_epsilon=`echo "scale=10; sqrt($CR_epsilon*$YO_epsilon*4.184)" | bc`
HCMM_YO_epsilon=`echo "scale=10; sqrt($HCMM_epsilon*$YO_epsilon*4.184)" | bc`
HOCO_YO_epsilon=`echo "scale=10; sqrt($HOCO_epsilon*$YO_epsilon*4.184)" | bc`
HOR_YO_epsilon=`echo "scale=10; sqrt($HOR_epsilon*$YO_epsilon*4.184)" | bc`
OR_YO_epsilon=`echo "scale=10; sqrt($OR_epsilon*$YO_epsilon*4.184)" | bc`
O2CM_YO_epsilon=`echo "scale=10; sqrt($O2CM_epsilon*$YO_epsilon*4.184)" | bc`
PO4_YO_epsilon=`echo "scale=10; sqrt($PO4_epsilon*$YO_epsilon*4.184)" | bc`

CR_YS_epsilon=`echo "scale=10; sqrt($CR_epsilon*$YS_epsilon*4.184)" | bc`
HCMM_YS_epsilon=`echo "scale=10; sqrt($HCMM_epsilon*$YS_epsilon*4.184)" | bc`
HOCO_YS_epsilon=`echo "scale=10; sqrt($HOCO_epsilon*$YS_epsilon*4.184)" | bc`
HOR_YS_epsilon=`echo "scale=10; sqrt($HOR_epsilon*$YS_epsilon*4.184)" | bc`
OR_YS_epsilon=`echo "scale=10; sqrt($OR_epsilon*$YS_epsilon*4.184)" | bc`
O2CM_YS_epsilon=`echo "scale=10; sqrt($O2CM_epsilon*$YS_epsilon*4.184)" | bc`
PO4_YS_epsilon=`echo "scale=10; sqrt($PO4_epsilon*$YS_epsilon*4.184)" | bc`

CR_YA_sigma=`echo "scale=10; ($CR_sigma+$YA_sigma*0.1)/2" | bc`
HCMM_YA_sigma=`echo "scale=10; ($HCMM_sigma+$YA_sigma*0.1)/2" | bc`
HOCO_YA_sigma=`echo "scale=10; ($HOCO_sigma+$YA_sigma*0.1)/2" | bc`
HOR_YA_sigma=`echo "scale=10; ($HOR_sigma+$YA_sigma*0.1)/2" | bc`
OR_YA_sigma=`echo "scale=10; ($OR_sigma+$YA_sigma*0.1)/2" | bc`
O2CM_YA_sigma=`echo "scale=10; ($O2CM_sigma+$YA_sigma*0.1)/2" | bc`
PO4_YA_sigma=`echo "scale=10; ($PO4_sigma+$YA_sigma*0.1)/2" | bc`

CR_YO_sigma=`echo "scale=10; ($CR_sigma+$YO_sigma*0.1)/2" | bc`
HCMM_YO_sigma=`echo "scale=10; ($HCMM_sigma+$YO_sigma*0.1)/2" | bc`
HOCO_YO_sigma=`echo "scale=10; ($HOCO_sigma+$YO_sigma*0.1)/2" | bc`
HOR_YO_sigma=`echo "scale=10; ($HOR_sigma+$YO_sigma*0.1)/2" | bc`
OR_YO_sigma=`echo "scale=10; ($OR_sigma+$YO_sigma*0.1)/2" | bc`
O2CM_YO_sigma=`echo "scale=10; ($O2CM_sigma+$YO_sigma*0.1)/2" | bc`
PO4_YO_sigma=`echo "scale=10; ($PO4_sigma+$YO_sigma*0.1)/2" | bc`

CR_YS_sigma=`echo "scale=10; ($CR_sigma+$YS_sigma*0.1)/2" | bc`
HCMM_YS_sigma=`echo "scale=10; ($HCMM_sigma+$YS_sigma*0.1)/2" | bc`
HOCO_YS_sigma=`echo "scale=10; ($HOCO_sigma+$YS_sigma*0.1)/2" | bc`
HOR_YS_sigma=`echo "scale=10; ($HOR_sigma+$YS_sigma*0.1)/2" | bc`
OR_YS_sigma=`echo "scale=10; ($OR_sigma+$YS_sigma*0.1)/2" | bc`
O2CM_YS_sigma=`echo "scale=10; ($O2CM_sigma+$YS_sigma*0.1)/2" | bc`
PO4_YS_sigma=`echo "scale=10; ($PO4_sigma+$YS_sigma*0.1)/2" | bc`


########################################################################################Internal

echo "------------------------------------------------------------------------------"
echo "CR_HT_epsilon    : $CR_HT_epsilon     CR_HT_sigma   : $CR_HT_sigma   "
echo "HCMM_HT_epsilon  : $HCMM_HT_epsilon   HCMM_HT_sigma : $HCMM_HT_sigma "
echo "HOCO_HT_epsilon  : $HOCO_HT_epsilon   HOCO_HT_sigma : $HOCO_HT_sigma "
echo "HOR_HT_epsilon   : $HOR_HT_epsilon    HOR_HT_sigma  : $HOR_HT_sigma  "
echo "OR_HT_epsilon    : $OR_HT_epsilon     OR_HT_sigma   : $OR_HT_sigma   "
echo "O2CM_HT_epsilon  : $O2CM_HT_epsilon   O2CM_HT_sigma : $O2CM_HT_sigma "
echo "PO4_HT_epsilon   : $PO4_HT_epsilon    PO4_HT_sigma  : $PO4_HT_sigma  "

echo "------------------------------------------------------------------------------"

echo "CR_OT_epsilon    : $CR_OT_epsilon     CR_OT_sigma   : $CR_OT_sigma   "
echo "HCMM_OT_epsilon  : $HCMM_OT_epsilon   HCMM_OT_sigma : $HCMM_OT_sigma "
echo "HOCO_OT_epsilon  : $HOCO_OT_epsilon   HOCO_OT_sigma : $HOCO_OT_sigma "
echo "HOR_OT_epsilon   : $HOR_OT_epsilon    HOR_OT_sigma  : $HOR_OT_sigma  "
echo "OR_OT_epsilon    : $OR_OT_epsilon     OR_OT_sigma   : $OR_OT_sigma   "
echo "O2CM_OT_epsilon  : $O2CM_OT_epsilon   O2CM_OT_sigma : $O2CM_OT_sigma "
echo "PO4_OT_epsilon   : $PO4_OT_epsilon    PO4_OT_sigma  : $PO4_OT_sigma  "
echo "------------------------------------------------------------------------------"

echo "YA_YO_sigma       : $YA_YO_sigma          YA_YO_epsilon   : $YA_YO_epsilon "
echo "YA_YS_sigma       : $YA_YS_sigma          YA_YS_epsilon   : $YA_YS_epsilon "
echo "YA_OT_sigma       : $YA_OT_sigma          YA_OT_epsilon   : $YA_OT_epsilon "
echo "YO_YS_sigma       : $YO_YS_sigma          YO_YS_epsilon   : $YO_YS_epsilon "
echo "YO_OT_sigma       : $YO_OT_sigma          YO_OT_epsilon   : $YO_OT_epsilon "

echo "#-----------units nm----------------" >> setparameters.inp	  
echo " @SET  CR_sigma 0.387541     " >> setparameters.inp
echo " @SET  HCMM_sigma 0.235197   " >> setparameters.inp
echo " @SET  HOCO_sigma 0.040001   " >> setparameters.inp
echo " @SET  HOR_sigma 0.040001    " >> setparameters.inp	  
echo " @SET  OR_sigma 0.315378     " >> setparameters.inp	  
echo " @SET  O2CM_sigma 0.302905   " >> setparameters.inp
echo " @SET  PO4_sigma 0.383086    " >> setparameters.inp	  
echo " @SET  HOH_sigma 0.040001    " >> setparameters.inp	  
echo " @SET  OH2_sigma 0.315057    " >> setparameters.inp	  
echo "#-----------units kjmol----------" >> setparameters.inp	  
echo " @SET  CR_epsilon 0.230120   " >> setparameters.inp
echo " @SET  HCMM_epsilon 0.092048 " >> setparameters.inp
echo " @SET  HOCO_epsilon 0.192464 " >> setparameters.inp
echo " @SET  HOR_epsilon 0.192464  " >> setparameters.inp
echo " @SET  OR_epsilon 0.636386   " >> setparameters.inp
echo " @SET  O2CM_epsilon 0.502080 " >> setparameters.inp
echo " @SET  PO4_epsilon 2.447640  " >> setparameters.inp
echo " @SET  HOH_epsilon 0.192464  " >> setparameters.inp
echo " @SET  OH2_epsilon 0.636386  " >> setparameters.inp
echo "#---------units kcalmol-----------------" >> setparameters.inp	  
echo " @SET  YA_epsilon 0.0000013298  " >> setparameters.inp
echo " @SET  YO_epsilon 0.1554     " >> setparameters.inp	  
echo " @SET  YS_epsilon 0.1554     " >> setparameters.inp	  
echo " @SET  OT_epsilon 0.1554     " >> setparameters.inp  
echo "# angstroms- sigma converted for LJ format in ck2p " >> setparameters.inp	  
echo " @SET  YA_sigma $YA_sigma" >> setparameters.inp                          
echo " @SET  YO_sigma $YO_sigma" >> setparameters.inp
echo " @SET  YS_sigma $YS_sigma" >> setparameters.inp
echo " @SET  OT_sigma $OT_sigma" >> setparameters.inp                         
echo "#------ ---HT from swissparm--------------------" >> setparameters.inp
echo " @SET CR_HT_epsilon      $CR_HT_epsilon   " >> setparameters.inp
echo " @SET HCMM_HT_epsilon    $HCMM_HT_epsilon " >> setparameters.inp
echo " @SET HOCO_HT_epsilon    $HOCO_HT_epsilon " >> setparameters.inp
echo " @SET HOR_HT_epsilon     $HOR_HT_epsilon  " >> setparameters.inp
echo " @SET OR_HT_epsilon      $OR_HT_epsilon   " >> setparameters.inp
echo " @SET O2CM_HT_epsilon    $O2CM_HT_epsilon " >> setparameters.inp
echo " @SET PO4_HT_epsilon     $PO4_HT_epsilon  " >> setparameters.inp
echo "#-------------------------------------------- " >> setparameters.inp
echo " @SET CR_HT_sigma     $CR_HT_sigma	    " >> setparameters.inp
echo " @SET HCMM_HT_sigma   $HCMM_HT_sigma	    " >> setparameters.inp
echo " @SET HOCO_HT_sigma   $HOCO_HT_sigma	    " >> setparameters.inp
echo " @SET HOR_HT_sigma    $HOR_HT_sigma	    " >> setparameters.inp
echo " @SET OR_HT_sigma     $OR_HT_sigma	    " >> setparameters.inp
echo " @SET O2CM_HT_sigma   $O2CM_HT_sigma	    " >> setparameters.inp
echo " @SET PO4_HT_sigma    $PO4_HT_sigma	    " >> setparameters.inp
echo "#--------------------OT from swissparm------- " >> setparameters.inp
echo " @SET CR_OT_epsilon      $CR_OT_epsilon   " >> setparameters.inp
echo " @SET HCMM_OT_epsilon    $HCMM_OT_epsilon " >> setparameters.inp
echo " @SET HOCO_OT_epsilon    $HOCO_OT_epsilon " >> setparameters.inp
echo " @SET HOR_OT_epsilon     $HOR_OT_epsilon  " >> setparameters.inp
echo " @SET OR_OT_epsilon      $OR_OT_epsilon   " >> setparameters.inp
echo " @SET O2CM_OT_epsilon    $O2CM_OT_epsilon " >> setparameters.inp
echo " @SET PO4_OT_epsilon     $PO4_OT_epsilon  " >> setparameters.inp
echo "#-------------------------------------------- " >> setparameters.inp
echo " @SET CR_OT_sigma     $CR_OT_sigma	    " >> setparameters.inp
echo " @SET HCMM_OT_sigma   $HCMM_OT_sigma	    " >> setparameters.inp
echo " @SET HOCO_OT_sigma   $HOCO_OT_sigma	    " >> setparameters.inp
echo " @SET HOR_OT_sigma    $HOR_OT_sigma	    " >> setparameters.inp
echo " @SET OR_OT_sigma     $OR_OT_sigma	    " >> setparameters.inp
echo " @SET O2CM_OT_sigma   $O2CM_OT_sigma	    " >> setparameters.inp
echo " @SET PO4_OT_sigma    $PO4_OT_sigma	    " >> setparameters.inp
echo "#------------------------clayff----------------- " >> setparameters.inp
echo " @SET YA_YO_sigma  $YA_YO_sigma		    " >> setparameters.inp
echo " @SET YA_YS_sigma  $YA_YS_sigma		    " >> setparameters.inp
echo " @SET YA_OT_sigma  $YA_OT_sigma		    " >> setparameters.inp
echo " @SET YO_YS_sigma  $YO_YS_sigma		    " >> setparameters.inp
echo " @SET YO_OT_sigma  $YO_OT_sigma		    " >> setparameters.inp
echo " @SET YS_OT_sigma  $YS_OT_sigma		    " >> setparameters.inp
echo "#-------------------------clayff-------------- " >> setparameters.inp
echo " @SET YA_YO_epsilon  $YA_YO_epsilon	    " >> setparameters.inp
echo " @SET YA_YS_epsilon  $YA_YS_epsilon	    " >> setparameters.inp
echo " @SET YA_OT_epsilon  $YA_OT_epsilon	    " >> setparameters.inp
echo " @SET YO_YS_epsilon  $YO_YS_epsilon	    " >> setparameters.inp
echo " @SET YO_OT_epsilon  $YO_OT_epsilon           " >> setparameters.inp
echo " @SET YS_OT_epsilon  $YS_OT_epsilon           " >> setparameters.inp
echo "#------------------gp-diaspore----------- "  >> setparameters.inp
echo " @SET CR_YA_epsilon     $CR_YA_epsilon    "  >> setparameters.inp
echo " @SET HCMM_YA_epsilon   $HCMM_YA_epsilon 	"  >> setparameters.inp
echo " @SET HOCO_YA_epsilon   $HOCO_YA_epsilon 	"  >> setparameters.inp
echo " @SET HOR_YA_epsilon    $HOR_YA_epsilon  	"  >> setparameters.inp
echo " @SET OR_YA_epsilon     $OR_YA_epsilon   	"  >> setparameters.inp
echo " @SET O2CM_YA_epsilon   $O2CM_YA_epsilon 	"  >> setparameters.inp
echo " @SET PO4_YA_epsilon    $PO4_YA_epsilon  	"  >> setparameters.inp
echo "#---------------------------------------- "  >> setparameters.inp
echo " @SET CR_YO_epsilon     $CR_YO_epsilon   	"  >> setparameters.inp
echo " @SET HCMM_YO_epsilon   $HCMM_YO_epsilon 	"  >> setparameters.inp
echo " @SET HOCO_YO_epsilon   $HOCO_YO_epsilon 	"  >> setparameters.inp
echo " @SET HOR_YO_epsilon    $HOR_YO_epsilon  	"  >> setparameters.inp
echo " @SET OR_YO_epsilon     $OR_YO_epsilon   	"  >> setparameters.inp
echo " @SET O2CM_YO_epsilon   $O2CM_YO_epsilon 	"  >> setparameters.inp
echo " @SET PO4_YO_epsilon    $PO4_YO_epsilon  	"  >> setparameters.inp
echo "#---------------------------------------- "  >> setparameters.inp
echo " @SET CR_YS_epsilon     $CR_YS_epsilon   	"  >> setparameters.inp
echo " @SET HCMM_YS_epsilon   $HCMM_YS_epsilon 	"  >> setparameters.inp
echo " @SET HOCO_YS_epsilon   $HOCO_YS_epsilon 	"  >> setparameters.inp
echo " @SET HOR_YS_epsilon    $HOR_YS_epsilon  	"  >> setparameters.inp
echo " @SET OR_YS_epsilon     $OR_YS_epsilon   	"  >> setparameters.inp
echo " @SET O2CM_YS_epsilon   $O2CM_YS_epsilon 	"  >> setparameters.inp
echo " @SET PO4_YS_epsilon    $PO4_YS_epsilon  	"  >> setparameters.inp
echo "#---------------------------------------- "  >> setparameters.inp
echo " @SET CR_YA_sigma	      $CR_YA_sigma     	"  >> setparameters.inp
echo " @SET HCMM_YA_sigma     $HCMM_YA_sigma   	"  >> setparameters.inp
echo " @SET HOCO_YA_sigma     $HOCO_YA_sigma   	"  >> setparameters.inp
echo " @SET HOR_YA_sigma      $HOR_YA_sigma    	"  >> setparameters.inp
echo " @SET OR_YA_sigma	      $OR_YA_sigma     	"  >> setparameters.inp
echo " @SET O2CM_YA_sigma     $O2CM_YA_sigma   	"  >> setparameters.inp
echo " @SET PO4_YA_sigma      $PO4_YA_sigma    	"  >> setparameters.inp
echo "#---------------------------------------- "  >> setparameters.inp
echo " @SET CR_YO_sigma	      $CR_YO_sigma     	"  >> setparameters.inp
echo " @SET HCMM_YO_sigma     $HCMM_YO_sigma   	"  >> setparameters.inp
echo " @SET HOCO_YO_sigma     $HOCO_YO_sigma   	"  >> setparameters.inp
echo " @SET HOR_YO_sigma      $HOR_YO_sigma    	"  >> setparameters.inp
echo " @SET OR_YO_sigma	      $OR_YO_sigma     	"  >> setparameters.inp
echo " @SET O2CM_YO_sigma     $O2CM_YO_sigma   	"  >> setparameters.inp
echo " @SET PO4_YO_sigma      $PO4_YO_sigma    	"  >> setparameters.inp
echo "#---------------------------------------- "  >> setparameters.inp
echo " @SET CR_YS_sigma	      $CR_YS_sigma     	"  >> setparameters.inp
echo " @SET HCMM_YS_sigma     $HCMM_YS_sigma   	"  >> setparameters.inp
echo " @SET HOCO_YS_sigma     $HOCO_YS_sigma   	"  >> setparameters.inp
echo " @SET HOR_YS_sigma      $HOR_YS_sigma    	"  >> setparameters.inp
echo " @SET OR_YS_sigma	      $OR_YS_sigma     	"  >> setparameters.inp
echo " @SET O2CM_YS_sigma     $O2CM_YS_sigma   	"  >> setparameters.inp
echo " @SET PO4_YS_sigma      $PO4_YS_sigma     "  >> setparameters.inp
echo "#---------------------------------------- "  >> setparameters.inp
