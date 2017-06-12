//
//  CallHistoryRecordGetUseCase.swift
//  Telephone
//
//  Copyright © 2008-2016 Alexey Kuznetsov
//  Copyright © 2016-2017 64 Characters
//
//  Telephone is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Telephone is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//

public protocol CallHistoryRecordGetUseCaseOutput {
    func update(record: CallHistoryRecord)
}

public final class CallHistoryRecordGetUseCase {
    fileprivate let history: CallHistory
    fileprivate let index: Int
    fileprivate let output: CallHistoryRecordGetUseCaseOutput

    public init(history: CallHistory, index: Int, output: CallHistoryRecordGetUseCaseOutput) {
        self.history = history
        self.index = index
        self.output = output
    }
}

extension CallHistoryRecordGetUseCase: UseCase {
    public func execute() {
        output.update(record: history.allRecords[index])
    }
}
