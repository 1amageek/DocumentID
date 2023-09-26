//
//  FunctionsError.swift
//
//
//  Created by Norikazu Muramoto on 2023/09/26.
//

import Foundation

/// The error domain for codes in the `FunctionsErrorCode` enum.
public let FunctionsErrorDomain: String = "com.firebase.functions"

/// The key for finding error details in the `NSError` userInfo.
public let FunctionsErrorDetailsKey: String = "details"

/**
 * The set of error status codes that can be returned from a Callable HTTPS tigger. These are the
 * canonical error codes for Google APIs, as documented here:
 * https://github.com/googleapis/googleapis/blob/master/google/rpc/code.proto#L26
 */
public enum FunctionsErrorCode: Int {
    /** The operation completed successfully. */
    case OK = 0

    /** The operation was cancelled (typically by the caller). */
    case cancelled = 1

    /** Unknown error or an error from a different error domain. */
    case unknown = 2

    /**
     * Client specified an invalid argument. Note that this differs from `FailedPrecondition`.
     * `InvalidArgument` indicates arguments that are problematic regardless of the state of the
     * system (e.g., an invalid field name).
     */
    case invalidArgument = 3

    /**
     * Deadline expired before operation could complete. For operations that change the state of the
     * system, this error may be returned even if the operation has completed successfully. For
     * example, a successful response from a server could have been delayed long enough for the
     * deadline to expire.
     */
    case deadlineExceeded = 4

    /** Some requested document was not found. */
    case notFound = 5

    /** Some document that we attempted to create already exists. */
    case alreadyExists = 6

    /** The caller does not have permission to execute the specified operation. */
    case permissionDenied = 7

    /**
     * Some resource has been exhausted, perhaps a per-user quota, or perhaps the entire file system
     * is out of space.
     */
    case resourceExhausted = 8

    /**
     * Operation was rejected because the system is not in a state required for the operation's
     * execution.
     */
    case failedPrecondition = 9

    /**
     * The operation was aborted, typically due to a concurrency issue like transaction aborts, etc.
     */
    case aborted = 10

    /** Operation was attempted past the valid range. */
    case outOfRange = 11

    /** Operation is not implemented or not supported/enabled. */
    case unimplemented = 12

    /**
     * Internal errors. Means some invariant expected by underlying system has been broken. If you
     * see one of these errors, something is very broken.
     */
    case `internal` = 13

    /**
     * The service is currently unavailable. This is a most likely a transient condition and may be
     * corrected by retrying with a backoff.
     */
    case unavailable = 14

    /** Unrecoverable data loss or corruption. */
    case dataLoss = 15

    /** The request does not have valid authentication credentials for the operation. */
    case unauthenticated = 16
}

/**
 * Takes an HTTP status code and returns the corresponding `FIRFunctionsErrorCode` error code.
 * This is the standard HTTP status code -> error mapping defined in:
 * https://github.com/googleapis/googleapis/blob/master/google/rpc/code.proto
 * - Parameter status An HTTP status code.
 * - Returns: The corresponding error code, or `FIRFunctionsErrorCodeUnknown` if none.
 */
internal func FunctionsCodeForHTTPStatus(_ status: NSInteger) -> FunctionsErrorCode {
    switch status {
        case 200:
            return .OK
        case 400:
            return .invalidArgument
        case 401:
            return .unauthenticated
        case 403:
            return .permissionDenied
        case 404:
            return .notFound
        case 409:
            return .alreadyExists
        case 429:
            return .resourceExhausted
        case 499:
            return .cancelled
        case 500:
            return .internal
        case 501:
            return .unimplemented
        case 503:
            return .unavailable
        case 504:
            return .deadlineExceeded
        default:
            return .internal
    }
}

extension FunctionsErrorCode {
    static func errorCode(forName name: String) -> FunctionsErrorCode {
        switch name {
            case "OK": return .OK
            case "CANCELLED": return .cancelled
            case "UNKNOWN": return .unknown
            case "INVALID_ARGUMENT": return .invalidArgument
            case "DEADLINE_EXCEEDED": return .deadlineExceeded
            case "NOT_FOUND": return .notFound
            case "ALREADY_EXISTS": return .alreadyExists
            case "PERMISSION_DENIED": return .permissionDenied
            case "RESOURCE_EXHAUSTED": return .resourceExhausted
            case "FAILED_PRECONDITION": return .failedPrecondition
            case "ABORTED": return .aborted
            case "OUT_OF_RANGE": return .outOfRange
            case "UNIMPLEMENTED": return .unimplemented
            case "INTERNAL": return .internal
            case "UNAVAILABLE": return .unavailable
            case "DATA_LOSS": return .dataLoss
            case "UNAUTHENTICATED": return .unauthenticated
            default: return .internal
        }
    }

    var descriptionForErrorCode: String {
        switch self {
            case .OK:
                return "OK"
            case .cancelled:
                return "CANCELLED"
            case .unknown:
                return "UNKNOWN"
            case .invalidArgument:
                return "INVALID ARGUMENT"
            case .deadlineExceeded:
                return "DEADLINE EXCEEDED"
            case .notFound:
                return "NOT FOUND"
            case .alreadyExists:
                return "ALREADY EXISTS"
            case .permissionDenied:
                return "PERMISSION DENIED"
            case .resourceExhausted:
                return "RESOURCE EXHAUSTED"
            case .failedPrecondition:
                return "FAILED PRECONDITION"
            case .aborted:
                return "ABORTED"
            case .outOfRange:
                return "OUT OF RANGE"
            case .unimplemented:
                return "UNIMPLEMENTED"
            case .internal:
                return "INTERNAL"
            case .unavailable:
                return "UNAVAILABLE"
            case .dataLoss:
                return "DATA LOSS"
            case .unauthenticated:
                return "UNAUTHENTICATED"
        }
    }
}
