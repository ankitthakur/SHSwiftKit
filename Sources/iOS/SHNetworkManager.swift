//
//  SHNetworkManager.swift
//  SHSwiftKit
//
//  Created by ankitthakur on 02/02/16.
//  Copyright © 2016 Ankit Thakur. All rights reserved.
//

import Foundation

/** SHNetworkManager Class

 */

typealias CompletionBlock = (data: NSData?, userInfo: [NSObject : AnyObject]?, error:NSError?) -> Void

struct SKHTTPRequest {
    var session:NSURLSession
    let task:NSURLSessionTask
    let taskIndex:Int
    let mediaType:MediaType?
    let completion:CompletionBlock?

}

enum MediaType {
    case Data(String, [String:AnyObject]?) // request url string, http body parameters, BLOB
    case BLOB(String, [String:AnyObject]?, NSData?) // request url string, http body parameters, BLOB
    case File(String, [String:AnyObject]?, NSURL) // // request url string, http body parameters, file url
    case Stream(String, [String:AnyObject]?, NSInputStream) // request url string, http body parameters, stream
}


let backgroundSessionIdentifier = "SKHTTPBackgroundSessionIdentifier";

class SHNetworkManager: NSObject, NSURLSessionDelegate, NSURLSessionTaskDelegate {

    static let sharedInstance = SHNetworkManager()




    var requestObjects:[SKHTTPRequest] = [];

    ////////////////////////////////////
    /////////// sessions ///////////////
    ////////////////////////////////////
    //  Default sessions behave similarly to other Foundation methods for downloading URLs. They use a persistent disk-based cache and store credentials in the user’s keychain.
    var defaultSession:NSURLSession?

    //  Ephemeral sessions do not store any data to disk; all caches, credential stores, and so on are kept in RAM and tied to the session. Thus, when your app invalidates the session, they are purged automatically.
    var ephemeralSession:NSURLSession?

    //  Background sessions are similar to default sessions, except that a separate process handles all data transfers.
    var backgroundSession:NSURLSession?


    //////////////////////////////////////////////
    /////////// configuration objects ////////////
    //////////////////////////////////////////////
    var defaultConfigObject:NSURLSessionConfiguration?;
    var ephemeralConfigObject:NSURLSessionConfiguration?;
    var backgroundConfigObject:NSURLSessionConfiguration?;

    /////////////////////////////////////////
    /////////// session tasks ///////////////
    /////////////////////////////////////////
    var dataTasks:[NSURLSessionDataTask] = [];
    var downloadTasks:[NSURLSessionDownloadTask] = [];
    var uploadTasks:[NSURLSessionUploadTask] = [];

    var mainQueue:NSOperationQueue = NSOperationQueue.mainQueue();
    var backgroundQueue:dispatch_queue_t = GlobalUtilityQueue;

    private override init(){

        super.init();

        defaultConfigObject = NSURLSessionConfiguration.defaultSessionConfiguration();
        ephemeralConfigObject = NSURLSessionConfiguration.ephemeralSessionConfiguration();
        backgroundConfigObject = NSURLSessionConfiguration.backgroundSessionConfigurationWithIdentifier(backgroundSessionIdentifier);

        // session for each configurations
        defaultSession = NSURLSession(configuration: defaultConfigObject!, delegate: self, delegateQueue: mainQueue);
        ephemeralSession = NSURLSession(configuration: ephemeralConfigObject!, delegate: self, delegateQueue: mainQueue);
        backgroundSession = NSURLSession(configuration: backgroundConfigObject!, delegate: self, delegateQueue: mainQueue);


    }

    func requestWithUrl(media:MediaType, completionBlock:CompletionBlock) -> Void
    {
        var sessionTask:NSURLSessionTask?;
        switch media {
        case .Data(_, _):
            dispatch_sync(backgroundQueue) {
                let object = self.requestWithData(media);
                if (object.error != nil) {
                    completionBlock(data: nil, userInfo: nil, error: object.error);
                }
                else{
                    sessionTask = object.session;
                    // store the request in array
                    self.requestObjects.append(SKHTTPRequest(session: self.defaultSession!, task: sessionTask!, taskIndex: self.requestObjects.count, mediaType: media, completion: completionBlock));
                    // To start the task, we need to tell it to resume by calling resume on the task
                    sessionTask!.resume();
                }

            }
            break

        case .File(_, _, _):
            dispatch_sync(backgroundQueue) {

            }
            break

        case .Stream(_, _, _):
            dispatch_sync(backgroundQueue) {

            }
            break

        default:
            break


        }

    }

    internal func requestWithData(media:MediaType) -> (session:NSURLSessionTask?, error:NSError?){
        var sessionTask:NSURLSessionTask?;
        var error:NSError?;

        switch media {
        case .Data(let urlString, let params):
            dispatch_sync(backgroundQueue) {
                let url = NSURL(string: urlString);
                let request:NSURLRequest = NSURLRequest(URL: url!);
                if params != nil {
                    let body : NSData = NSKeyedArchiver.archivedDataWithRootObject(params!);
                    request.setValue(body, forKey: "HTTPBody");
                }
                sessionTask = self.defaultSession!.dataTaskWithRequest(request);
            }
        default:
            error = NSError(domain: "Invalid Media Type", code: 111, userInfo: ["localizedDescription":"media type is not of Data type"]);


        }

        return (sessionTask, error);
    }

    // MARK:- NSURLSessionDataDelegate
    /*
    * Messages related to the operation of a task that delivers data
    * directly to the delegate.
    */


    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void)
    {

    }

    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didBecomeDownloadTask downloadTask: NSURLSessionDownloadTask){

    }
    @available(iOS 9.0, *)
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didBecomeStreamTask streamTask: NSURLSessionStreamTask)
    {

    }

    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData)
    {

    }

    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, willCacheResponse proposedResponse: NSCachedURLResponse, completionHandler: (NSCachedURLResponse?) -> Void)
    {

    }

    // MARK:- NSURLSessionDownloadDelegate : NSURLSessionTaskDelegate {

    /*
    * Messages related to the operation of a task that writes data to a
    * file and notifies the delegate upon completion.
    */


    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL)
    {

    }

    /* Sent periodically to notify the delegate of download progress. */


    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64)
    {

    }

    func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64)
    {

    }


    // MARK:- NSURLSessionStreamDelegate
    @available(iOS 9.0, *)
    func URLSession(session: NSURLSession, readClosedForStreamTask streamTask: NSURLSessionStreamTask)
    {

    }
    @available(iOS 9.0, *)
    func URLSession(session: NSURLSession, writeClosedForStreamTask streamTask: NSURLSessionStreamTask)
    {

    }
    @available(iOS 9.0, *)
    func URLSession(session: NSURLSession, betterRouteDiscoveredForStreamTask streamTask: NSURLSessionStreamTask)
    {

    }
    @available(iOS 9.0, *)
    func URLSession(session: NSURLSession, streamTask: NSURLSessionStreamTask, didBecomeInputStream inputStream: NSInputStream, outputStream: NSOutputStream)
    {

    }

}
