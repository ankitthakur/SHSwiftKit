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

typealias CompletionBlock = (data: NSData?, userInfo: URLResponse?, error: NSError?) -> Void

class SKHTTPRequest:AnyObject {
	var session:URLSession?
	var task:URLSessionTask?
	var request:URLRequest?
	var completionBlock:CompletionBlock?
	var responseData:NSMutableData?

}


let backgroundSessionIdentifier = "SKHTTPBackgroundSessionIdentifier"

class SHNetworkManager: NSObject, URLSessionDelegate, URLSessionTaskDelegate {

	static let sharedInstance = SHNetworkManager()

	var requestObjects: NSMutableArray = NSMutableArray(capacity: 0)

	// MARK: - URLSessionDelegate

	func urlSession(_ session: URLSession, didBecomeInvalidWithError error: NSError?) {

	}

	func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
		print(challenge.protectionSpace.host)
	}

	func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {

	}

  // MARK: URLSessionTaskDelegate
	func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: (URLRequest?) -> Void) {

	}

	func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
		print("challenging host in task : \(challenge.protectionSpace.host)")
	}

	func urlSession(_ session: URLSession, task: URLSessionTask, needNewBodyStream completionHandler: (InputStream?) -> Void) {

	}

	func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {

	}

	func filteredRequestObjects(session:URLSession) -> [SKHTTPRequest]?{

		let predicate:Predicate = Predicate(format: "session=%@",session)

		let params:[SKHTTPRequest]? = requestObjects.filtered(using: predicate) as? [SKHTTPRequest]

		return params
	}

	func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: NSError?) {

		let urlResponse:HTTPURLResponse = task.response as! HTTPURLResponse;
		let statusCode = urlResponse.statusCode

		let params = filteredRequestObjects(session: session)

		guard let param:SKHTTPRequest = (params?.last)! as SKHTTPRequest else{
			print("unknown request has error")
		}

		if statusCode >= 200 && statusCode < 300 {
			param.completionBlock!(data: param.responseData, userInfo: task.response, error: error)
		}
		else{
			param.completionBlock!(data: nil, userInfo: task.response, error: error)
		}

		requestObjects.remove(param as AnyObject)
	}

	// MARK: URLSessionDataDelegate

	func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: (URLSession.ResponseDisposition) -> Swift.Void){

		let disposition:URLSession.ResponseDisposition  = URLSession.ResponseDisposition.allow;
		completionHandler(disposition);

	}

	func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data){

		let params = filteredRequestObjects(session: session)

		guard let param:SKHTTPRequest = params?.last else{
			print("unknown request has error")
			return
		}

		if data.count > 0 {
			if param.responseData?.length == 0 {
				param.responseData = NSMutableData(data: data)
			}
			else{
				param.responseData?.append(data)
			}
		}

		
	}


	func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, willCacheResponse proposedResponse: CachedURLResponse, completionHandler: (CachedURLResponse?) -> Swift.Void){

	}

}
