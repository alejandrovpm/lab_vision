# Warmup Questions

1.  What is the clone url of this repository?
    >   answer

2.  What is the output of the ``cal`` command?

        multi
        line
        answer

# Homework Questions

1.  What is the ``grep``command?
    >   Busca una palabra en las lineas de un directorio o un archivo

2.  What is a *makefile*?
    >   Describe relaciones enntre archivos en un programa o declara comandos para la actualizacion de esos archivos

3.  What is *git*?
    >   Es un sistema de control de versiones. Guarda archivos a traves del tiempo de manera organizada logrando que las versiones anteriores se puedan abrir nuevamente. Los archivos son copiados en cada repositorio y cada computador

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   Busca un archivo por un nombre dado, prune evita un directorio Ejempolo find . -path './Downloads' -prune  se busca evitando el directorio /Downloads

5.  Where is the file ``xxxxxx``
    >   Busca por por el nombre ``xxxxxx`` de la raiz. 

6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >   No se encontraron archivos con "gnu"

7.  How many files contain ``gpl`` inside in ``/usr/src``
    >   No se encontraron archivos con "gpl"

8.  What does the ``cut`` command do?
    >  Remueve secciones de una linea

9.  What does the ``wget`` command do?
    >   descarga archivos en una red

10.  What does the ``diff`` command do?
    >   Operador logico que muestra las lineas que son diferentes entre dos archivos

11.  How many users exist in *Guitaca*?
    >   48

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   -f 1,7 -d':' /etc/passwd | sort -t':' -k2

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >    grep "/sbin/nologin" "/etc/passwd" | wc,

14.  What is the name of the linux distribution running on *Guitaca*?
    >   fedora 20 (Heisenbug)

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   212

17. How many unique images are in the ``sipi_images`` folder?
    >   answer
    
