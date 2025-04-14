source ~/.config/jellyfin/backup.env

if [ -z "$RESTORE_DIR" ]; then
  echo "RESTORE_DIR is undefined... exiting";
  exit;
fi

if [ -z "$WORKDIR" ]; then
  echo "WORKDIR is undefined... exiting";
  exit;
fi
if [ -z "$SRC_DIR" ]; then
  echo "SRC_DIR is undefined... exiting";
  exit;
fi
if [ -z "$BORG_REPO" ]; then
  echo "BORG_REPO is undefined... exiting";
  exit;
fi
if [ -z "$BORG_PASSPHRASE" ]; then
  echo "BORG_PASSPHRASE is undefined... exiting";
  exit;
fi
if [ -z "$ENCRYPTION" ]; then
  echo "ENCRYPTION is undefined... exiting";
  exit;
fi

cd "$WORKDIR";

borg info $BORG_REPO >& /dev/null
info_exit_code=$?;

if [ $info_exit_code -gt 0 ]; then
  echo "repo does not exsist; exiting";
  exit 1;
fi

archive_name=$(borg list --sort-by timestamp --last 1 --format "{archive}")
echo $archive_name

# borg extract user@host:path/to/repo_directory::Monday path/to/target_directory --exclude '*.ext'

cd $RESTORE_DIR

if [ ! -e "$SRC_DIR" ]; then
  # borg list --sort-by timestamp --last 1 "$BORG_REPO::${archive_name}" 
  borg extract "$BORG_REPO::${archive_name}"
else
  echo "SRC_DIR exsist; exiting";
  exit 1;
fi


