echo "Création d'une nouvelle démo: $1"
flutter create --platform web --project-name $1 \
--description "Gestion $1" \
demo/$1