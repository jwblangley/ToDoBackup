# ToDoBackup
Automated log of my to do lists

## Installation
Clone this repository and then set up the following cron rule using `crontab -e`
```cron
@daily "cd <repo> && ./backup.sh"
```

### WSL
Using cron with WSL is a bit annoying, so one possible workaround is to not use `cron` at all to launch this service, but to add the script to the `.bashrc`/`.zshrc` file in use. Since we check whether the back up is already made, this should be a fairly lightweight operation. Add to the relevant file the following:
```bash
(cd <this repo> && ./backup.sh >> backup.log 2>&1 &)
```

## Usage
* Create a symlink from `records/ToDo.md` to an easily accessible location or vice versa (may be needed for WSL to play nicely with Windows applications).
    * Also do this for the assets folder which can be used to store, for example, images used in your to do lists. N.B: you may need to use a bind mount rather than a symlink!
* Edit your To do list as you please!
