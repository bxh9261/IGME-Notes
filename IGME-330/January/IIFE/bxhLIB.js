(function(){
    
    // handy helper functions!
    function getRandomColor(){
            
        const getByte = _ => 55 + Math.round(Math.random() * 200)
            
        return `rgba(${getByte()}, ${getByte()}, ${getByte()}, 0.8)`;
    }   

    function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

})();