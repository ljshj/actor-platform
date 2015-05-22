//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/engine/AsyncListEngine.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/BserCreator.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/engine/AsyncListEngine.h"
#include "im/actor/model/droidkit/engine/AsyncStorageInt.h"
#include "im/actor/model/droidkit/engine/ListEngineDisplayListener.h"
#include "im/actor/model/droidkit/engine/ListEngineDisplayLoadCallback.h"
#include "im/actor/model/droidkit/engine/ListEngineItem.h"
#include "im/actor/model/droidkit/engine/ListStorageDisplayEx.h"
#include "im/actor/model/droidkit/engine/ObjectCache.h"
#include "java/lang/Long.h"
#include "java/util/ArrayList.h"
#include "java/util/List.h"
#include "java/util/concurrent/CopyOnWriteArrayList.h"

@interface DKAsyncListEngine () {
 @public
  DKAsyncStorageInt *asyncStorageInt_;
  DKObjectCache *cache_;
  id LOCK_;
  JavaUtilConcurrentCopyOnWriteArrayList *listeners_;
}

- (id<DKListEngineDisplayLoadCallback>)coverWithDKListEngineDisplayLoadCallback:(id<DKListEngineDisplayLoadCallback>)callback;

@end

J2OBJC_FIELD_SETTER(DKAsyncListEngine, asyncStorageInt_, DKAsyncStorageInt *)
J2OBJC_FIELD_SETTER(DKAsyncListEngine, cache_, DKObjectCache *)
J2OBJC_FIELD_SETTER(DKAsyncListEngine, LOCK_, id)
J2OBJC_FIELD_SETTER(DKAsyncListEngine, listeners_, JavaUtilConcurrentCopyOnWriteArrayList *)

__attribute__((unused)) static id<DKListEngineDisplayLoadCallback> DKAsyncListEngine_coverWithDKListEngineDisplayLoadCallback_(DKAsyncListEngine *self, id<DKListEngineDisplayLoadCallback> callback);

@interface DKAsyncListEngine_$1 : NSObject < DKListEngineDisplayLoadCallback > {
 @public
  DKAsyncListEngine *this$0_;
  id<DKListEngineDisplayLoadCallback> val$callback_;
}

- (void)onLoadedWithItems:(id<JavaUtilList>)items
               withTopKey:(jlong)topSortKey
            withBottomKey:(jlong)bottomSortKey;

- (instancetype)initWithDKAsyncListEngine:(DKAsyncListEngine *)outer$
      withDKListEngineDisplayLoadCallback:(id<DKListEngineDisplayLoadCallback>)capture$0;

@end

J2OBJC_EMPTY_STATIC_INIT(DKAsyncListEngine_$1)

J2OBJC_FIELD_SETTER(DKAsyncListEngine_$1, this$0_, DKAsyncListEngine *)
J2OBJC_FIELD_SETTER(DKAsyncListEngine_$1, val$callback_, id<DKListEngineDisplayLoadCallback>)

__attribute__((unused)) static void DKAsyncListEngine_$1_initWithDKAsyncListEngine_withDKListEngineDisplayLoadCallback_(DKAsyncListEngine_$1 *self, DKAsyncListEngine *outer$, id<DKListEngineDisplayLoadCallback> capture$0);

__attribute__((unused)) static DKAsyncListEngine_$1 *new_DKAsyncListEngine_$1_initWithDKAsyncListEngine_withDKListEngineDisplayLoadCallback_(DKAsyncListEngine *outer$, id<DKListEngineDisplayLoadCallback> capture$0) NS_RETURNS_RETAINED;

J2OBJC_TYPE_LITERAL_HEADER(DKAsyncListEngine_$1)

@implementation DKAsyncListEngine

- (instancetype)initWithDKListStorageDisplayEx:(id<DKListStorageDisplayEx>)storage
                             withBSBserCreator:(id<BSBserCreator>)creator {
  DKAsyncListEngine_initWithDKListStorageDisplayEx_withBSBserCreator_(self, storage, creator);
  return self;
}

- (void)addOrUpdateItem:(BSBserObject<DKListEngineItem> *)item {
  @synchronized(LOCK_) {
    [((DKObjectCache *) nil_chk(cache_)) onObjectUpdatedWithId:JavaLangLong_valueOfWithLong_([((BSBserObject<DKListEngineItem> *) nil_chk(item)) getEngineId]) withId:item];
    id<JavaUtilList> items = new_JavaUtilArrayList_init();
    [items addWithId:item];
    [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) addOrUpdateItemsWithJavaUtilList:items];
    for (id<DKListEngineDisplayListener> __strong l in nil_chk(listeners_)) {
      [((id<DKListEngineDisplayListener>) nil_chk(l)) addOrUpdate:item];
    }
  }
}

- (void)addOrUpdateItems:(id<JavaUtilList>)items {
  @synchronized(LOCK_) {
    for (BSBserObject<DKListEngineItem> * __strong i in nil_chk(items)) {
      [((DKObjectCache *) nil_chk(cache_)) onObjectUpdatedWithId:JavaLangLong_valueOfWithLong_([((BSBserObject<DKListEngineItem> *) nil_chk(i)) getEngineId]) withId:i];
    }
    [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) addOrUpdateItemsWithJavaUtilList:items];
    for (id<DKListEngineDisplayListener> __strong l in nil_chk(listeners_)) {
      [((id<DKListEngineDisplayListener>) nil_chk(l)) addOrUpdateWithList:items];
    }
  }
}

- (void)replaceItems:(id<JavaUtilList>)items {
  @synchronized(LOCK_) {
    [((DKObjectCache *) nil_chk(cache_)) clear];
    for (BSBserObject<DKListEngineItem> * __strong i in nil_chk(items)) {
      [cache_ onObjectUpdatedWithId:JavaLangLong_valueOfWithLong_([((BSBserObject<DKListEngineItem> *) nil_chk(i)) getEngineId]) withId:i];
    }
    [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) replaceItemsWithJavaUtilList:items];
    for (id<DKListEngineDisplayListener> __strong l in nil_chk(listeners_)) {
      [((id<DKListEngineDisplayListener>) nil_chk(l)) onItemsReplacedWithList:items];
    }
  }
}

- (void)removeItemWithKey:(jlong)key {
  @synchronized(LOCK_) {
    [((DKObjectCache *) nil_chk(cache_)) removeObjectWithId:JavaLangLong_valueOfWithLong_(key)];
    [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) removeWithLongArray:[IOSLongArray newArrayWithLongs:(jlong[]){ key } count:1]];
    for (id<DKListEngineDisplayListener> __strong l in nil_chk(listeners_)) {
      [((id<DKListEngineDisplayListener>) nil_chk(l)) onItemRemovedWithKey:key];
    }
  }
}

- (void)removeItemsWithKeys:(IOSLongArray *)keys {
  @synchronized(LOCK_) {
    {
      IOSLongArray *a__ = keys;
      jlong const *b__ = ((IOSLongArray *) nil_chk(a__))->buffer_;
      jlong const *e__ = b__ + a__->size_;
      while (b__ < e__) {
        jlong key = *b__++;
        [((DKObjectCache *) nil_chk(cache_)) removeObjectWithId:JavaLangLong_valueOfWithLong_(key)];
      }
    }
    [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) removeWithLongArray:keys];
    for (id<DKListEngineDisplayListener> __strong l in nil_chk(listeners_)) {
      [((id<DKListEngineDisplayListener>) nil_chk(l)) onItemsRemovedWithKeys:keys];
    }
  }
}

- (void)clear {
  @synchronized(LOCK_) {
    [((DKObjectCache *) nil_chk(cache_)) clear];
    [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) clear];
    for (id<DKListEngineDisplayListener> __strong l in nil_chk(listeners_)) {
      [((id<DKListEngineDisplayListener>) nil_chk(l)) onListClear];
    }
  }
}

- (id)getValueWithKey:(jlong)key {
  @synchronized(LOCK_) {
    BSBserObject<DKListEngineItem> *res = [((DKObjectCache *) nil_chk(cache_)) lookupWithId:JavaLangLong_valueOfWithLong_(key)];
    if (res != nil) {
      return res;
    }
  }
  BSBserObject<DKListEngineItem> *res = [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) getValueWithLong:key];
  if (res != nil) {
    @synchronized(LOCK_) {
      [cache_ onObjectLoadedWithId:JavaLangLong_valueOfWithLong_(key) withId:res];
    }
  }
  return res;
}

- (id)getHeadValue {
  BSBserObject<DKListEngineItem> *res = [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) getHeadValue];
  if (res != nil) {
    @synchronized(LOCK_) {
      [((DKObjectCache *) nil_chk(cache_)) onObjectLoadedWithId:JavaLangLong_valueOfWithLong_([res getEngineId]) withId:res];
    }
  }
  return res;
}

- (jboolean)isEmpty {
  return [self getCount] == 0;
}

- (jint)getCount {
  return [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) getCount];
}

- (void)subscribeWithListener:(id<DKListEngineDisplayListener>)listener {
  if (![((JavaUtilConcurrentCopyOnWriteArrayList *) nil_chk(listeners_)) containsWithId:listener]) {
    [listeners_ addWithId:listener];
  }
}

- (void)unsubscribeWithListener:(id<DKListEngineDisplayListener>)listener {
  [((JavaUtilConcurrentCopyOnWriteArrayList *) nil_chk(listeners_)) removeWithId:listener];
}

- (void)loadForwardWithLimit:(jint)limit
                withCallback:(id<DKListEngineDisplayLoadCallback>)callback {
  [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) loadForwardWithNSString:nil withJavaLangLong:nil withInt:limit withDKListEngineDisplayLoadCallback:DKAsyncListEngine_coverWithDKListEngineDisplayLoadCallback_(self, callback)];
}

- (void)loadForwardAfterSortKey:(jlong)afterSortKey
                      withLimit:(jint)limit
                   withCallback:(id<DKListEngineDisplayLoadCallback>)callback {
  [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) loadForwardWithNSString:nil withJavaLangLong:JavaLangLong_valueOfWithLong_(afterSortKey) withInt:limit withDKListEngineDisplayLoadCallback:DKAsyncListEngine_coverWithDKListEngineDisplayLoadCallback_(self, callback)];
}

- (void)loadForwardWithQuery:(NSString *)query
                   withLimit:(jint)limit
                withCallback:(id<DKListEngineDisplayLoadCallback>)callback {
  [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) loadForwardWithNSString:query withJavaLangLong:nil withInt:limit withDKListEngineDisplayLoadCallback:DKAsyncListEngine_coverWithDKListEngineDisplayLoadCallback_(self, callback)];
}

- (void)loadForwardWithQuery:(NSString *)query
                afterSortKey:(jlong)afterSortKey
                   withLimit:(jint)limit
                withCallback:(id<DKListEngineDisplayLoadCallback>)callback {
  [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) loadForwardWithNSString:query withJavaLangLong:JavaLangLong_valueOfWithLong_(afterSortKey) withInt:limit withDKListEngineDisplayLoadCallback:DKAsyncListEngine_coverWithDKListEngineDisplayLoadCallback_(self, callback)];
}

- (void)loadBackwardWithLimit:(jint)limit
                 withCallback:(id<DKListEngineDisplayLoadCallback>)callback {
  [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) loadBackwardWithNSString:nil withJavaLangLong:nil withInt:limit withDKListEngineDisplayLoadCallback:DKAsyncListEngine_coverWithDKListEngineDisplayLoadCallback_(self, callback)];
}

- (void)loadBackwardBeforeSortKey:(jlong)beforeSortKey
                        withLimit:(jint)limit
                     withCallback:(id<DKListEngineDisplayLoadCallback>)callback {
  [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) loadBackwardWithNSString:nil withJavaLangLong:JavaLangLong_valueOfWithLong_(beforeSortKey) withInt:limit withDKListEngineDisplayLoadCallback:DKAsyncListEngine_coverWithDKListEngineDisplayLoadCallback_(self, callback)];
}

- (void)loadBackwardWithQuery:(NSString *)query
                    withLimit:(jint)limit
                 withCallback:(id<DKListEngineDisplayLoadCallback>)callback {
  [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) loadBackwardWithNSString:query withJavaLangLong:nil withInt:limit withDKListEngineDisplayLoadCallback:DKAsyncListEngine_coverWithDKListEngineDisplayLoadCallback_(self, callback)];
}

- (void)loadBackwardWithQuery:(NSString *)query
                beforeSortKey:(jlong)beforeSortKey
                    withLimit:(jint)limit
                 withCallback:(id<DKListEngineDisplayLoadCallback>)callback {
  [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) loadBackwardWithNSString:query withJavaLangLong:JavaLangLong_valueOfWithLong_(beforeSortKey) withInt:limit withDKListEngineDisplayLoadCallback:DKAsyncListEngine_coverWithDKListEngineDisplayLoadCallback_(self, callback)];
}

- (void)loadCenterWithSortKey:(jlong)centerSortKey
                    withLimit:(jint)limit
                 withCallback:(id<DKListEngineDisplayLoadCallback>)callback {
  [((DKAsyncStorageInt *) nil_chk(asyncStorageInt_)) loadCenterWithLong:centerSortKey withInt:limit withDKListEngineDisplayLoadCallback:DKAsyncListEngine_coverWithDKListEngineDisplayLoadCallback_(self, callback)];
}

- (id<DKListEngineDisplayLoadCallback>)coverWithDKListEngineDisplayLoadCallback:(id<DKListEngineDisplayLoadCallback>)callback {
  return DKAsyncListEngine_coverWithDKListEngineDisplayLoadCallback_(self, callback);
}

@end

void DKAsyncListEngine_initWithDKListStorageDisplayEx_withBSBserCreator_(DKAsyncListEngine *self, id<DKListStorageDisplayEx> storage, id<BSBserCreator> creator) {
  (void) NSObject_init(self);
  self->cache_ = new_DKObjectCache_init();
  self->LOCK_ = new_NSObject_init();
  self->listeners_ = new_JavaUtilConcurrentCopyOnWriteArrayList_init();
  self->asyncStorageInt_ = new_DKAsyncStorageInt_initWithDKListStorageDisplayEx_withBSBserCreator_(storage, creator);
}

DKAsyncListEngine *new_DKAsyncListEngine_initWithDKListStorageDisplayEx_withBSBserCreator_(id<DKListStorageDisplayEx> storage, id<BSBserCreator> creator) {
  DKAsyncListEngine *self = [DKAsyncListEngine alloc];
  DKAsyncListEngine_initWithDKListStorageDisplayEx_withBSBserCreator_(self, storage, creator);
  return self;
}

id<DKListEngineDisplayLoadCallback> DKAsyncListEngine_coverWithDKListEngineDisplayLoadCallback_(DKAsyncListEngine *self, id<DKListEngineDisplayLoadCallback> callback) {
  return new_DKAsyncListEngine_$1_initWithDKAsyncListEngine_withDKListEngineDisplayLoadCallback_(self, callback);
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(DKAsyncListEngine)

@implementation DKAsyncListEngine_$1

- (void)onLoadedWithItems:(id<JavaUtilList>)items
               withTopKey:(jlong)topSortKey
            withBottomKey:(jlong)bottomSortKey {
  @synchronized(this$0_->LOCK_) {
    for (BSBserObject<DKListEngineItem> * __strong i in nil_chk(items)) {
      [((DKObjectCache *) nil_chk(this$0_->cache_)) onObjectLoadedWithId:JavaLangLong_valueOfWithLong_([((BSBserObject<DKListEngineItem> *) nil_chk(i)) getEngineId]) withId:i];
    }
  }
  [((id<DKListEngineDisplayLoadCallback>) nil_chk(val$callback_)) onLoadedWithItems:items withTopKey:topSortKey withBottomKey:bottomSortKey];
}

- (instancetype)initWithDKAsyncListEngine:(DKAsyncListEngine *)outer$
      withDKListEngineDisplayLoadCallback:(id<DKListEngineDisplayLoadCallback>)capture$0 {
  DKAsyncListEngine_$1_initWithDKAsyncListEngine_withDKListEngineDisplayLoadCallback_(self, outer$, capture$0);
  return self;
}

@end

void DKAsyncListEngine_$1_initWithDKAsyncListEngine_withDKListEngineDisplayLoadCallback_(DKAsyncListEngine_$1 *self, DKAsyncListEngine *outer$, id<DKListEngineDisplayLoadCallback> capture$0) {
  self->this$0_ = outer$;
  self->val$callback_ = capture$0;
  (void) NSObject_init(self);
}

DKAsyncListEngine_$1 *new_DKAsyncListEngine_$1_initWithDKAsyncListEngine_withDKListEngineDisplayLoadCallback_(DKAsyncListEngine *outer$, id<DKListEngineDisplayLoadCallback> capture$0) {
  DKAsyncListEngine_$1 *self = [DKAsyncListEngine_$1 alloc];
  DKAsyncListEngine_$1_initWithDKAsyncListEngine_withDKListEngineDisplayLoadCallback_(self, outer$, capture$0);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(DKAsyncListEngine_$1)
