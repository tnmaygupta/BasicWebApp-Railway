# Build the project
./gradlew clean build

# Build the image
docker buildx create
docker buildx build --platform linux/amd64 --progress plain --load -t eist .
docker buildx stop
docker buildx rm

# Upload the updated image to DockerHub
# Note:
# - You need to be logged into docker on your machine
# - You need to have created the repository on DockerHub, in this case "tnmaygupta/basic-web-app"
# - In your case, you must change all instances of "tnmaygupta/basic-web-app" to your own repository name
docker tag eist:latest tnmaygupta/basic-web-app:0.0.1
docker push tnmaygupta/basic-web-app:0.0.1

# Remove local images
docker rmi eist:latest
docker rmi tnmaygupta/basic-web-app:0.0.1
