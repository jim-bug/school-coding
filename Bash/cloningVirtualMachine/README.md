# cloningVirtualMachine

![Licenza](https://img.shields.io/badge/license-GNU-blue.svg)
![Versione](https://img.shields.io/badge/version-1.0.0-green.svg)

## INDICE

- [Introduzione](#introduzione)
- [Uso](#uso)
- [Licenza](#licenza)
- [Contatti](#contatti)


## Introduzione
CloningVirtualMachine è uno script scritto in bash in grado di creare una macchina virtuale con un disco (.vdi) già esistente, farne il clone e registrarla su VirtualBox.

## Uso
Usare l'help
```
bash cloningVirtualMachine.sh -h

```
Creare una macchina virtuale con clone:
```
bash cloningVirtualMachine.sh -n nomeVM -o osType -p "path_to_vdi"
```


### Note:
La Macchina virtuale che verrà creata avrà 2 core e 4096MB di memoria di lavoro.
Il tipo di sistema operativo può essere scelto dall'output del seguente comando:

```
VBoxManage list ostypes | grep Description
```

## Licenza

[GPL-3.0](https://choosealicense.com/licenses/gpl-3.0/)


## Contatti
Puoi contattarmi presso questo indirizzo email -> ignazioandsperandeo@gmail.com
