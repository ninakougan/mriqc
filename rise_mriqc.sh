#!/usr/bin/bash
#
#SBATCH -A p31589
#SBATCH -p normal
#SBATCH -t 05:00:00
#SBATCH --mem=20G
#SBATCH -J mriqc-rise
#SBATCH	--mail-type=END,FAIL
#SBATCH	--mail-user=ninakougan@northwestern.edu

module purge
module load singularity/latest
echo "modules loaded"
cd /projects/b1108

singularity run --cleanenv -B /projects/b1108:/projects/b1108/ /projects/b1108/software/singularity_images/mriqc-latest.simg -v /projects/b1108/data/RISE -v /projects/b1108/projects/Temple/RISE/mriqc participant --participant-label ${1}
# change above to --clean-workdir so that the work directory is cleared and you save space
