/**
 * Created by aykj on 2016/12/22.
 */

import React, { Component } from 'react';
import {
    AppRegistry,
    StyleSheet,
    Text,
    View,
    Dimensions,
    TouchableOpacity,
    Animated,
    NativeModules
} from 'react-native';
import ShareView from './ShareView'
var GZYUMShare = NativeModules.UMShare

const {width,height} = Dimensions.get('window')
const shareViewHeight = 200

// var shareViewAnimation = {
//     duration: 500,
//     create: {
//         type: LayoutAnimation.Types.linear,
//         property: LayoutAnimation.Properties.opacity,
//     },
//     update: {
//         type: LayoutAnimation.Types.easeInEaseOut,
//     },
// };

export {GZYUMShare}

export default (Sup) => class GZYUMShareView extends Sup{

    static propTypes = {
        title:React.PropTypes.string,
        shareText:React.PropTypes.string,
        imageName:React.PropTypes.string,
        webUrl:React.PropTypes.string
    }


    constructor(props){
        super(props)
        this.state = {
            visible:false,
            shareViewLeft:0,
            shareViewTop:height,
            shareViewPositionAnim:new Animated.ValueXY()
        }
    }

    componentDidUpdate() {
        if(this.state.visible == true){
            this.state.shareViewPositionAnim.setValue({x:0,y:height})
            Animated.timing(
                this.state.shareViewPositionAnim,
                {
                    toValue:{x:0,y:(height - shareViewHeight)},
                    duration:250
                }
            ).start()
        }
    }

    showShareView(){
        this.setState({
            visible:true
        })
    }

    dismissShareView(){
        this.setState({
            visible:false
        })
    }

    renderShareView(title,shareText,imageName,webUrl){
        var params = {title:title,shareText:shareText,imageName:imageName,webUrl:webUrl}
        if(this.state.visible == true){
            return(
                    <View onStartShouldSetResponder={() => true}
                          onResponderRelease={() => this.dismissShareView()}
                          style={styles.containerStyle}>
                        <Animated.View style={[styles.shareViewStyle,{left:this.state.shareViewPositionAnim.x,top:this.state.shareViewPositionAnim.y}]} >
                            <ShareView style={{flex:1}} {...params}/>
                        </Animated.View>
                    </View>
            )
        }else{
            return null
        }
    }


    render(){
        return this.renderShareView()
    }

}


 const styles = StyleSheet.create({

     containerStyle:{
         position:'absolute',
         left:0,
         top:0,
         width:width,
         height:height,
         backgroundColor:'rgba(0,0,0,0.7)'
     },

     shareViewStyle:{
         position:'absolute',
         // top:height - shareViewHeight,
         width:width,
         height:shareViewHeight
     }


 })