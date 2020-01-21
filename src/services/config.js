export const CONFIG = {
  app_host: 'https://abt.charitybuzz.com',
}

export default {
  get: ({key}) => {
    if(key){
      return CONFIG[key]
    }
    else{
      return CONFIG
    }
  },

}
