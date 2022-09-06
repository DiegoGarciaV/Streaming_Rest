<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Prueba de velocidad API Rest</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
    <body>
        <header>

        </header>
        <section>
            <p id="message"></p>
            <canvas id="canva" width="1920px" height="1080px"></canvas>
            <div class="text"></div>
        </section>
    </body>
    <script type="text/javascript">

        
        let frameChunk = [];
        let availableChunks = true;
        let runingFramePlay = false;
        let acumulatedTime = 0;
        let auxAcumTime = 0;
        let chunkId = 1;
        while(availableChunks && chunkId <= 15)
        {
            const TXT_URL = 'api/v0/frames/getFramesChunk/00';
            let chunkIdString = (chunkId < 10 ? "0" + chunkId : "" + chunkId);
            setTimeout(() => {

                $.ajax
                (
                    {
                        url : TXT_URL + chunkIdString,
                        dataType: "text",
                        success : function (data) 
                        {
                            playVideo(JSON.parse(data),acumulatedTime);
                        },
                        error: (err) =>{
                            console.error(err);
                            availableChunks = false;
                            console.log(chunkId);
                        }
                    }
                );
                        
                
            }, 400*chunkId);
            
            chunkId = chunkId + 1;
        }
            

        function playVideo(newFrameChunk, acumTime){

            runingFramePlay = true;
            var canvas = document.getElementById("canva");
            var ctx = canvas.getContext("2d");
            let initTime =  newFrameChunk[0].time*1;
            newFrameChunk.forEach((element,index) => {
                var image = new Image();
                image.src = "data:image/jpg;base64," +element.image;
                    auxAcumTime = element.time - initTime + acumTime;
                image.onload = () => {
                    
                    const displayTime = element.time - initTime + acumTime;
                    setTimeout(() => {
                        ctx.drawImage(image, 0, 0);
                        console.log(element.chunkId)
                    }, displayTime);
                }; 
            });
            acumulatedTime = auxAcumTime;
        }
        

        
    </script>
</html>