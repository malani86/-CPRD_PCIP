#!/usr/bin/env nextflow
nextflow.enable.dsl = 2
/*
    Pour executer le fichier : ./nextflow run pipeline.nf 
*/


def ultimateMenu()
{
    println "\n==================== Menu principal ======================================"
    println "1. Pour créer et indexer un génome chimérique"
    println "2. Pour aligner des données .fastq avec un genome de reference"
    println "3. Pour parametrer et commencer l'analysedes données .paf"
    println "============================================================================\n"
    print "Votre choix: "
    def choix0 = System.console().readLine()
    
    return choix0
}


def displayMenu() {
    println "\n==================== Menu d'analyse ======================================"
    println "1. Pour entrer le nom du fichier .paf a traiter"
    println "2. Pour entrer le nom de la cible (séquence du VIH)"
    println "3. Pour entrer la taille de la cible (séquence du VIH)"
    println "4. Pour parametrer le gap d'alignement max acceptable "
    println "5. Pour parametrer la distance max acceptable par rapport au LTR "
    println "6. Pour renvoyer un fichier .paf trié "
    println "7. Pour parametrer le chevauchement d'alignement max acceptable "
    println "8. Pour parametrer la couverture des reads "
    println "9. Pour parametrer l'espace entre les sites d'integration "
    println "10. Pour voir les parametres saisis"
    println "0. Pour quitter et démarrer l'analyse\n(uniquement si tous les parametres sont renseignés)"
    println "============================================================================\n"
    print "Votre choix: "
    def choix = System.console().readLine()
    
    return choix
}


/* exemple de parametres:
genome = AF003887_2.fasta
hiv = AF003887.fasta
fastq= FAV37185_0.fastq

PAF = FAV37185_TARGETHOST.paf
targetLenght = 9739
targetNAme = AF003887|AF003887
gapAlignment = 100
distanceToLTR=100
returnFilteredOut=True
overlap=15

depth=10
spaceBetweenIS=1000
*/



def mainMenu() {
    def continuer = true

    while (continuer) {
        def choice0 = ultimateMenu()
        switch (choice0) {
            case "1":
                print "Veuillez entrer le nom du fichier .fasta contenant le genome humain : "
                humanChoice = System.console().readLine()
                print "Veuillez entrer le nom du fichier .fasta contenant le genome du VIH : "
                hivChoice = System.console().readLine()
                break
            case "2":
                print "Veuillez entrer le nom que vous souhaitez donner à votre fichier .paf\n(sans le .paf): "
                mapping = System.console().readLine()
                print "Veuillez entrer le nom du fichier fastq contenant les données à aligner (avec le .fastq): "
                fastq = System.console().readLine()

                break
            case "3":
                fileChoice = null
                targetName = null
                targetLenth = null
                gapAlignment = null
                distanceToLTR = null
                yn = null
                returnFilteredOut = null
                overlap = null
                depth = null
                spaceBetweenIS = null
                while (continuer) {
                    def choice = displayMenu()
                    switch (choice) {
                        case "1":
                            print "Veuillez entrer le nom du fichier .paf (avec le .paf) : "
                            fileChoice = System.console().readLine()
                            break
                        case "2":
                            print "Veuillez entrer le nom de la séquence VIH (exemple: AFXXXXXX|AFXXXXXX): "
                            targetName = System.console().readLine()
                            break
                        case "3":
                            print "Veuillez entrer la taille de la séquence VIH :"
                            targetLenth = System.console().readLine()
                            break
                        case "4":
                            print "Veuillez entrer le gap d'alignement : "
                            gapAlignment = System.console().readLine()
                            break
                        case "5":
                            print "Veuillez entrer la distance au LTR : "
                            distanceToLTR = System.console().readLine()
                            break
                        case "6":
                            print "Veuillez entrer Y/n pour avoir fichier .paf trié : "
                            yn = System.console().readLine()
                            if (yn == "Y"){returnFilteredOut = 'True'}
                            else{returnFilteredOut = 'False'}
                            break
                        case "7":
                            print "Veuillez entrer le chevauchement d'alignement : "
                            overlap = System.console().readLine()
                            break
                        case "8":
                            print "Veuillez entrer la couverture des reads : "
                            depth = System.console().readLine()
                            break
                        case "9":
                            print "Veuillez entrer l'espace entre les sites d'integration : "
                            spaceBetweenIS = System.console().readLine()
                            break
                        case "10":
                            if(fileChoice){
                                println "\n* Vous avez saisi le nom du fichier .paf : $fileChoice"
                            }else{
                                println "* Nom du fichier .paf non défini"
                            }
                            
                            if(targetName){
                                println "* Vous avez saisi le nom de la séquence VIH: : $targetName"
                            }else {
                                println "* Nom de la séquence VIH non défini"
                            }
                            
                            if(targetLenth){
                                println "* Vous avez saisi la taille de la séquence VIH : $targetLenth"
                            }else{
                                println "* Taille de la séquence VIH non définie"
                            }

                            if(gapAlignment){
                                println "* Vous avez saisi le gap d'alignement : $gapAlignment"
                            }else{
                                println "* Gap d'alignement non défini"
                            }
                            
                            if(distanceToLTR){
                                println "* Vous avez saisi la distance au LTR : $distanceToLTR"
                            }else{
                                println "* Distance au LTR non définie"
                            }
                            
                            if(yn){
                                println "* Vous avez saisi : $yn pour le choix du fichier .paf trié"
                            }else{
                                println "* Choix pour fichier .paf trié non défini"
                            }
                            
                            if(overlap){
                                println "* Vous avez saisi le chevauchement d'alignement : $overlap"
                            }else{
                                println "* Chevauchement d'alignement non défini"
                            }
                            if(depth){
                                println "* Vous avez saisi la couverture des reads : $depth"
                            }else{
                                println "* Couverture des reads non définie"
                            }
                            
                            if(spaceBetweenIS){
                                println "* Vous avez saisi l'espace entre les sites d'integration : $spaceBetweenIS"
                            }else{
                                println "* Espace entre les sites d'integration non défini"
                            }
                            
                            break
                        case "0":
                            println "Début de l'analyse..."
                            continuer = false // Met à jour la variable pour sortir de la boucle
                            break
                        default:
                            println "Choix invalide. Veuillez réessayer."
                        }
                    }
            default:
                println "Choix invalide. Veuillez réessayer."         
                }

            }
    

    
    //ça c'est pour recuperer le chemin du repertoire dans lequel on se situe, tres pratique
    project_dir = projectDir


    //ces parametres vont servir en arguments lors de l'execution des fichiers .py et donc être recupere dans les fichiers .py via sys.argv[1]
    param_genome = """${humanChoice}"""
    param_hiv = """${hivChoice}"""


    param_mapping="""${mapping}"""
    param_fastq="""${fastq}"""

    param_filter = """${project_dir}/${fileChoice}"""
    param_targetName = """${targetName}"""
    
    param_targetLenth = """${targetLenth}"""
    param_gapAlignment = """${gapAlignment}"""
    param_distanceToLTR = """${distanceToLTR}"""
    param_returnFilteredOut = """${returnFilteredOut}"""
    param_overlap = """${overlap}"""
    param_breakpoint = """${project_dir}/${fileChoice.substring(0, fileChoice.length() - 4)}_filtered.paf """
    
    param_summarise = """${project_dir}/${fileChoice.substring(0, fileChoice.length() - 4)}_filtered_IS.csv """
    param_depth = """${depth}"""
    param_spaceBetweenIS = """${spaceBetweenIS}"""


//pipeline et processus

    process genomeTask { 
        
        output:
        stdout

        script:
        """
        python3 ${project_dir}/targethostGenome.py ${project_dir}/${param_genome} ${project_dir}/${param_hiv}
        """
    }
    
    process mappingTask {
        input:
        stdin

        output:
        stdout

        script: 
        """ 
        python3 ${project_dir}/mapping.py '${param_mapping}' '${param_fastq}'
        """ 

    }
    process filterTask {
        input:
        stdin

        output:
        stdout

        script:
        """
        python3 ${project_dir}/PCIP_filter.py ${param_filter} "${param_targetName}"
        """
    }
    process breakpointTask {
        input:
        stdin

        output:
        stdout
        """
        python3 ${project_dir}/PCIP_breakpoints.py ${param_breakpoint} "${param_targetName}" ${param_targetLenth} ${param_gapAlignment} ${param_distanceToLTR} ${param_returnFilteredOut} ${param_overlap}
        """
    }
    process summariseTask {
        input:
        stdin

        output:
        stdout
        """
        python3 ${project_dir}/PCIP_summarise.py ${param_summarise} ${param_depth} ${param_spaceBetweenIS}
        """
    }

   

}

workflow {
    genomeTask | mappingTask | filterTask | breakpointTask | summariseTask | view
}

mainMenu()
