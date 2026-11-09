module

public import Mathlib
public import TauCeti.ModelTheory.Infinitary.Semantics

/-!
# Classifying topoi of geometric theories: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`, together with the definitions their statements need, all with real bodies on native
carriers. The API around each target, the special cases and the Checks stay in the README.

Headlines stated, with their README targets:

* 1.2 `GeometricFormula.realize_hom` and `GeometricFormula.realize_toInf`;
  1.3 `CatStructure.isModel_ofStructure_iff`; 1.4 `CatStructure.IsModel.map`;
* 2.2 (b) `GeometricFormula.exists_interp_eq_iSup_exs`; 2.3 `exists_isClassifyingSite`;
  2.4 `IsClassifyingSite.exists_equivalence`; 2.5 `IsClassifyingSite.exists_quotient_topology`
  and `IsClassifyingSite.exists_quotient_theory`;
* 3.1 `isOfPresheafType_of_isHorn`; 3.2 `isClassifyingSite_genericObject`;
  3.3 `isClassifyingSite_genericTorsor` and `moritaEquivalent_torsorTheory_iff`;
  3.4 `isClassifyingSite_genericInterval`;
* 4.1 `isClassifyingSite_genericRing` and `finitePresentation_of_isFinitelyPresentable`;
  4.2 `isSheaf_forget_zariskiTopology`; 4.3 `isClassifyingSite_localRingTheory`.

Not stated: README 2.2 (a), the correspondence between models of a Horn theory in
`Sheaf K (Type u)` and the filtering functors on its classifying category, lacking
GrothendieckTopoi's `IsFiltering`; the classifying category itself is therefore not defined here,
no stated headline using it. Geometric morphisms and Diaconescu's theorem are GrothendieckTopoi's
(Layer 2); the universal property here is written with their inverse images, left exact left
adjoints between categories of sheaves, so that it is statable on Mathlib's carriers.
-/

@[expose] public section

universe w u₁ u₂ u₃ u₄ v v' u u'

open CategoryTheory CategoryTheory.Limits FirstOrder

namespace TauCetiRoadmap.ClassifyingTopoi

attribute [local instance high] Sheaf.instHasColimitsOfShape

/-! ## Layer 1: geometric logic and its semantics -/

/-- **1.1.** Geometric formulas over a first-order language `L` in the context `Fin n`: built
from atomic formulas by finite conjunction, disjunction indexed by a type in `Type w`, and
existential quantification of the last variable. -/
inductive GeometricFormula (L : FirstOrder.Language.{u₁, u₂}) :
    ℕ → Type (max u₁ u₂ (w + 1)) where
  /-- The true formula. -/
  | top {n : ℕ} : GeometricFormula L n
  /-- Binary conjunction. -/
  | and {n : ℕ} (φ ψ : GeometricFormula L n) : GeometricFormula L n
  /-- Disjunction of a family indexed by `ι : Type w`. -/
  | iSup {n : ℕ} {ι : Type w} (φ : ι → GeometricFormula L n) : GeometricFormula L n
  /-- Equality of two terms. -/
  | equal {n : ℕ} (t₁ t₂ : L.Term (Fin n)) : GeometricFormula L n
  /-- A relation symbol applied to terms. -/
  | rel {n k : ℕ} (R : L.Relations k) (ts : Fin k → L.Term (Fin n)) : GeometricFormula L n
  /-- Existential quantification of the last variable of the context `Fin (n + 1)`. -/
  | ex {n : ℕ} (φ : GeometricFormula L (n + 1)) : GeometricFormula L n

variable {L : FirstOrder.Language.{u₁, u₂}}

/-- **1.1.** The false formula: the disjunction of the empty family. -/
def GeometricFormula.bot {n : ℕ} : GeometricFormula.{w} L n :=
  .iSup (ι := PEmpty) PEmpty.elim

/-- **1.1.** A geometric sequent `φ ⊢ ψ` in the context `Fin n`. -/
structure Sequent (L : FirstOrder.Language.{u₁, u₂}) where
  /-- The length of the context. -/
  n : ℕ
  /-- The hypothesis. -/
  lhs : GeometricFormula.{w} L n
  /-- The conclusion. -/
  rhs : GeometricFormula.{w} L n

variable (L) in
/-- **1.1.** A geometric theory: a set of geometric sequents. -/
abbrev GeometricTheory := Set (Sequent.{w} L)

/-- **1.2.** Satisfaction of a geometric formula in a structure on a type, at an assignment of
the context. -/
def GeometricFormula.Realize {M : Type v} [L.Structure M] :
    {n : ℕ} → GeometricFormula.{w} L n → (Fin n → M) → Prop
  | _, .top, _ => True
  | _, .and φ ψ, x => φ.Realize x ∧ ψ.Realize x
  | _, .iSup φ, x => ∃ i, (φ i).Realize x
  | _, .equal t₁ t₂, x => t₁.realize x = t₂.realize x
  | _, .rel R ts, x => FirstOrder.Language.Structure.RelMap R fun i => (ts i).realize x
  | _, .ex φ, x => ∃ a : M, φ.Realize (Fin.snoc x a)

/-- **1.2.** A sequent holds in a structure on a type when every assignment satisfying its
hypothesis satisfies its conclusion. -/
def Sequent.Realize (σ : Sequent.{w} L) (M : Type v) [L.Structure M] : Prop :=
  ∀ x : Fin σ.n → M, σ.lhs.Realize x → σ.rhs.Realize x

/-- **1.2.** A model of a geometric theory in sets. -/
def GeometricTheory.IsSetModel (T : GeometricTheory.{w} L) (M : Type v) [L.Structure M] : Prop :=
  ∀ σ ∈ T, σ.Realize M

/-- **1.2.** Geometric formulas are preserved by homomorphisms of structures. -/
theorem GeometricFormula.realize_hom {M : Type v} {N : Type v'} [L.Structure M]
    [L.Structure N] (f : M →[L] N) {n : ℕ} (φ : GeometricFormula.{w} L n) (x : Fin n → M)
    (h : φ.Realize x) : φ.Realize (f ∘ x) :=
  sorry

open Classical in
/-- **1.2.** A geometric formula as an `L_{∞ω}` formula of Tau Ceti, with no free variables and
branching carrier `Σ X : Type w, X`: the disjunction of `φ : ι → _` becomes the disjunction over
the pairs `⟨X, x⟩`, whose branch is `φ x` when `X = ι` and `⊥` otherwise. -/
noncomputable def GeometricFormula.toInf :
    {n : ℕ} → GeometricFormula.{w} L n → L.BoundedFormulaInf (Σ X : Type w, X) Empty n
  | _, .top => ⊤
  | _, .and φ ψ => φ.toInf ⊓ ψ.toInf
  | _, .iSup (ι := ι) φ => .iSup fun p => if h : p.1 = ι then (φ (cast h p.2)).toInf else ⊥
  | _, .equal t₁ t₂ => .equal (t₁.relabel Sum.inr) (t₂.relabel Sum.inr)
  | _, .rel R ts => .rel R fun i => (ts i).relabel Sum.inr
  | _, .ex φ => φ.toInf.ex

/-- **1.2.** The translation into Tau Ceti's `L_{∞ω}` preserves satisfaction. -/
theorem GeometricFormula.realize_toInf {M : Type v} [L.Structure M] {n : ℕ}
    (φ : GeometricFormula.{w} L n) (x : Fin n → M) :
    φ.toInf.Realize (Empty.elim : Empty → M) x ↔ φ.Realize x :=
  sorry

/-- **1.3.** An `L`-structure in a category with finite products: an object, a morphism
`Aᵏ ⟶ A` for each `k`-ary function symbol and an object over `Aᵏ` for each `k`-ary relation
symbol, whose image is the interpretation of the relation. -/
structure CatStructure (L : FirstOrder.Language.{u₁, u₂}) (E : Type u) [Category.{v} E]
    [HasFiniteProducts E] where
  /-- The underlying object. -/
  carrier : E
  /-- The interpretation of a function symbol. -/
  funMap : ∀ {k : ℕ}, L.Functions k → ((∏ᶜ fun _ : Fin k => carrier) ⟶ carrier)
  /-- An object over `Aᵏ` whose image interprets a relation symbol. -/
  relMap : ∀ {k : ℕ}, L.Relations k → Over (∏ᶜ fun _ : Fin k => carrier)

variable {E : Type u} [Category.{v} E]

/-- **1.3.** The `n`-th power of the carrier, the object of assignments of the context
`Fin n`. -/
noncomputable abbrev CatStructure.pow [HasFiniteProducts E] (M : CatStructure L E) (n : ℕ) : E :=
  ∏ᶜ fun _ : Fin n => M.carrier

/-- **1.3.** The interpretation of a term in the context `Fin n` as a morphism `Aⁿ ⟶ A`. -/
noncomputable def CatStructure.termMap [HasFiniteProducts E] (M : CatStructure L E) {n : ℕ} :
    L.Term (Fin n) → (M.pow n ⟶ M.carrier)
  | .var i => Pi.π _ i
  | .func f ts => Pi.lift (fun j => M.termMap (ts j)) ≫ M.funMap f

/-- **1.3.** The interpretation of a geometric formula in the context `Fin n` as a subobject of
`Aⁿ`: meets, images of coproducts, equalizers, pullbacks of images, and images along the
projection forgetting the last variable. -/
noncomputable def CatStructure.interp [HasFiniteLimits E] [HasImages E] [HasCoproducts.{w} E]
    (M : CatStructure L E) : {n : ℕ} → GeometricFormula.{w} L n → Subobject (M.pow n)
  | _, .top => ⊤
  | _, .and φ ψ => M.interp φ ⊓ M.interp ψ
  | _, .iSup φ => imageSubobject (Sigma.desc fun i => (M.interp (φ i)).arrow)
  | _, .equal t₁ t₂ => equalizerSubobject (M.termMap t₁) (M.termMap t₂)
  | _, .rel R ts =>
      (Subobject.pullback (Pi.lift fun i => M.termMap (ts i))).obj (imageSubobject (M.relMap R).hom)
  | n, .ex φ =>
      (Subobject.exists (Pi.lift fun i : Fin n =>
        Pi.π (fun _ : Fin (n + 1) => M.carrier) i.castSucc)).obj (M.interp φ)

/-- **1.3.** A model of a geometric theory: the interpretation of the hypothesis of every axiom
lies below that of its conclusion. -/
def CatStructure.IsModel [HasFiniteLimits E] [HasImages E] [HasCoproducts.{w} E]
    (M : CatStructure L E) (T : GeometricTheory.{w} L) : Prop :=
  ∀ σ ∈ T, M.interp σ.lhs ≤ M.interp σ.rhs

/-- **1.3.** A homomorphism of structures: a morphism of carriers commuting with the function
symbols and mapping each relation into its counterpart. -/
structure CatStructure.IsHom [HasFiniteLimits E] [HasImages E] (M N : CatStructure L E)
    (h : M.carrier ⟶ N.carrier) : Prop where
  /-- Compatibility with the function symbols. -/
  funMap : ∀ {k : ℕ} (f : L.Functions k),
    M.funMap f ≫ h = Limits.Pi.map (fun _ => h) ≫ N.funMap f
  /-- The relations are mapped into the relations. -/
  relMap : ∀ {k : ℕ} (R : L.Relations k), imageSubobject (M.relMap R).hom ≤
    (Subobject.pullback (Limits.Pi.map fun _ : Fin k => h)).obj (imageSubobject (N.relMap R).hom)

/-- **1.3.** Two structures are isomorphic when an isomorphism of carriers is a homomorphism in
both directions. -/
def CatStructure.Isomorphic [HasFiniteLimits E] [HasImages E] (M N : CatStructure L E) : Prop :=
  ∃ e : M.carrier ≅ N.carrier, M.IsHom N e.hom ∧ N.IsHom M e.inv

/-- **1.3.** A structure on a type, as a structure in the category `Type u`. -/
noncomputable def CatStructure.ofStructure (M : Type u) [L.Structure M] :
    CatStructure L (Type u) where
  carrier := M
  funMap f :=
    (Types.productIso _).hom ≫ TypeCat.ofHom fun x => FirstOrder.Language.Structure.funMap f x
  relMap {k} R := Over.mk
    (TypeCat.ofHom
      (fun x : {x : Fin k → M // FirstOrder.Language.Structure.RelMap R x} => x.1) ≫
      (Types.productIso _).inv)

/-- **1.3.** The categorical semantics in `Type u` is the set-theoretic one. -/
theorem CatStructure.isModel_ofStructure_iff (T : GeometricTheory.{u} L) (M : Type u)
    [L.Structure M] : (CatStructure.ofStructure M).IsModel T ↔ T.IsSetModel M :=
  sorry

/-- **1.4.** The image of a structure under a functor preserving finite products: the carrier
`F A`, the function symbols through the comparison `F (Aᵏ) ≅ (F A)ᵏ`. -/
noncomputable def CatStructure.map [HasFiniteProducts E] {E' : Type u'} [Category.{v'} E']
    [HasFiniteProducts E'] (M : CatStructure L E) (F : E ⥤ E') [PreservesFiniteProducts F] :
    CatStructure L E' where
  carrier := F.obj M.carrier
  funMap f := inv (piComparison F fun _ => M.carrier) ≫ F.map (M.funMap f)
  relMap R := Over.mk (F.map (M.relMap R).hom ≫ piComparison F fun _ => M.carrier)

/-- **1.4.** The inverse image of a geometric morphism between sheaf topoi, a left exact left
adjoint, maps models to models. -/
theorem CatStructure.IsModel.map {C D : Type u} [SmallCategory C] [SmallCategory D]
    {J : GrothendieckTopology C} {K : GrothendieckTopology D} {T : GeometricTheory.{u} L}
    {M : CatStructure L (Sheaf J (Type u))} (hM : M.IsModel T)
    (F : Sheaf J (Type u) ⥤ Sheaf K (Type u)) [PreservesFiniteLimits F] [F.IsLeftAdjoint] :
    (M.map F).IsModel T :=
  sorry

/-! ## Layer 2: classifying topoi -/

/-- **2.1.** `(C, J)` with the model `U` classifies `T`: for every small site `(D, K)`, every
model of `T` in `Sh(D, K)` is isomorphic to the image of `U` under a left exact left adjoint
`Sh(C, J) ⥤ Sh(D, K)`, and evaluation at the carrier of `U` is a bijection from natural
transformations between two such functors onto the homomorphisms between the image models. -/
def IsClassifyingSite (T : GeometricTheory.{u} L) {C : Type u} [SmallCategory C]
    (J : GrothendieckTopology C) (U : CatStructure L (Sheaf J (Type u))) : Prop :=
  U.IsModel T ∧ ∀ (D : Type u) [SmallCategory D] (K : GrothendieckTopology D),
    (∀ M : CatStructure L (Sheaf K (Type u)), M.IsModel T →
      ∃ (F : Sheaf J (Type u) ⥤ Sheaf K (Type u)) (_ : PreservesFiniteLimits F),
        F.IsLeftAdjoint ∧ M.Isomorphic (U.map F)) ∧
    ∀ (F G : Sheaf J (Type u) ⥤ Sheaf K (Type u)) [PreservesFiniteLimits F]
      [PreservesFiniteLimits G], F.IsLeftAdjoint → G.IsLeftAdjoint →
      Function.Injective (fun α : F ⟶ G => α.app U.carrier) ∧
      ∀ h : F.obj U.carrier ⟶ G.obj U.carrier,
        (U.map F).IsHom (U.map G) h ↔ ∃ α : F ⟶ G, α.app U.carrier = h

/-- **2.2.** Horn formulas: finite conjunctions of atomic formulas. -/
def GeometricFormula.IsHorn : {n : ℕ} → GeometricFormula.{w} L n → Prop
  | _, .top => True
  | _, .and φ ψ => φ.IsHorn ∧ ψ.IsHorn
  | _, .iSup _ => False
  | _, .equal _ _ => True
  | _, .rel _ _ => True
  | _, .ex _ => False

/-- **2.2.** A Horn theory: every axiom is a sequent between Horn formulas. -/
def GeometricTheory.IsHorn (T : GeometricTheory.{w} L) : Prop :=
  ∀ σ ∈ T, σ.lhs.IsHorn ∧ σ.rhs.IsHorn

/-- **2.2.** Existential quantification of the last `m` variables of the context
`Fin (n + m)`. -/
def GeometricFormula.exs {n : ℕ} : {m : ℕ} → GeometricFormula.{w} L (n + m) →
    GeometricFormula.{w} L n
  | 0, φ => φ
  | m + 1, φ => exs (m := m) (.ex φ)

/-- **2.2 (b).** The normal form: in every sheaf topos, a geometric formula has the
interpretation of a `u`-small disjunction of existential quantifications of Horn formulas. -/
theorem GeometricFormula.exists_interp_eq_iSup_exs {n : ℕ} (φ : GeometricFormula.{u} L n) :
    ∃ (ι : Type u) (m : ι → ℕ) (θ : ∀ i, GeometricFormula.{u} L (n + m i)),
      (∀ i, (θ i).IsHorn) ∧ ∀ (D : Type u) [SmallCategory D] (K : GrothendieckTopology D)
        (M : CatStructure L (Sheaf K (Type u))),
        M.interp φ = M.interp (.iSup fun i => (θ i).exs) :=
  sorry

/-- **2.3.** Every geometric theory has a classifying site, its syntactic site, in the universe
of the language and of the theory's disjunctions. -/
theorem exists_isClassifyingSite (T : GeometricTheory.{max u₁ u₂ u} L) :
    ∃ (C : Type (max u₁ u₂ u)) (_ : SmallCategory C) (J : GrothendieckTopology C)
      (U : CatStructure L (Sheaf J (Type (max u₁ u₂ u)))), IsClassifyingSite T J U :=
  sorry

/-- **2.4.** Two classifying sites of the same theory have equivalent topoi of sheaves, by an
equivalence carrying one generic model to the other. -/
theorem IsClassifyingSite.exists_equivalence {T : GeometricTheory.{u} L} {C C' : Type u}
    [SmallCategory C] [SmallCategory C'] {J : GrothendieckTopology C}
    {J' : GrothendieckTopology C'} {U : CatStructure L (Sheaf J (Type u))}
    {U' : CatStructure L (Sheaf J' (Type u))} (hU : IsClassifyingSite T J U)
    (hU' : IsClassifyingSite T J' U') :
    ∃ e : Sheaf J (Type u) ≌ Sheaf J' (Type u), (U.map e.functor).Isomorphic U' :=
  sorry

/-- **2.5.** A quotient of a theory classified by `(C, J)` is classified by a finer topology on
`C`, with the sheafified generic model. -/
theorem IsClassifyingSite.exists_quotient_topology {T T' : GeometricTheory.{u} L} (hT : T ⊆ T')
    {C : Type u} [SmallCategory C] {J : GrothendieckTopology C}
    {U : CatStructure L (Sheaf J (Type u))} (hU : IsClassifyingSite T J U) :
    ∃ J' : GrothendieckTopology C, J ≤ J' ∧
      IsClassifyingSite T' J'
        (U.map (sheafToPresheaf J (Type u) ⋙ presheafToSheaf J' (Type u))) :=
  sorry

/-- **2.5.** Every finer topology on a classifying site classifies a quotient of the theory,
with the sheafified generic model. -/
theorem IsClassifyingSite.exists_quotient_theory {T : GeometricTheory.{u} L} {C : Type u}
    [SmallCategory C] {J J' : GrothendieckTopology C} {U : CatStructure L (Sheaf J (Type u))}
    (hU : IsClassifyingSite T J U) (hJ : J ≤ J') :
    ∃ T' : GeometricTheory.{u} L, T ⊆ T' ∧
      IsClassifyingSite T' J'
        (U.map (sheafToPresheaf J (Type u) ⋙ presheafToSheaf J' (Type u))) :=
  sorry

/-- **2.6.** Two geometric theories, possibly over different languages, are Morita-equivalent
when they have classifying sites whose topoi of sheaves are equivalent. -/
def MoritaEquivalent {L' : FirstOrder.Language.{u₃, u₄}} (T : GeometricTheory.{u} L)
    (T' : GeometricTheory.{u} L') : Prop :=
  ∃ (C C' : Type u) (_ : SmallCategory C) (_ : SmallCategory C') (J : GrothendieckTopology C)
    (J' : GrothendieckTopology C') (U : CatStructure L (Sheaf J (Type u)))
    (U' : CatStructure L' (Sheaf J' (Type u))),
    IsClassifyingSite T J U ∧ IsClassifyingSite T' J' U' ∧
      Nonempty (Sheaf J (Type u) ≌ Sheaf J' (Type u))

/-! ## Layer 3: theories of presheaf type -/

/-- **3.1.** A geometric theory is of presheaf type when it is classified by a small category
with the trivial topology, that is by a presheaf topos. -/
def IsOfPresheafType (T : GeometricTheory.{u} L) : Prop :=
  ∃ (C : Type u) (_ : SmallCategory C)
    (U : CatStructure L (Sheaf (⊥ : GrothendieckTopology C) (Type u))), IsClassifyingSite T ⊥ U

/-- **3.1.** Horn theories are of presheaf type, with a site in the universe of the language
and of the theory's disjunctions. -/
theorem isOfPresheafType_of_isHorn (T : GeometricTheory.{max u₁ u₂ u} L) (hT : T.IsHorn) :
    IsOfPresheafType T :=
  sorry

/-- **3.2.** The theory of objects: the empty theory over the empty language. -/
def objectTheory : GeometricTheory.{u} FirstOrder.Language.empty := ∅

/-- **3.2.** The generic object: the inclusion of finite sets into sets, as a presheaf on the
opposite of the skeleton of finite sets. -/
noncomputable def genericObject :
    CatStructure FirstOrder.Language.empty
      (Sheaf (⊥ : GrothendieckTopology FintypeCat.Skeleton.{u}ᵒᵖ) (Type u)) where
  carrier := (sheafBotEquivalence (Type u)).inverse.obj
    (unopUnop _ ⋙ FintypeCat.Skeleton.incl ⋙ FintypeCat.incl)
  funMap f := Empty.elim f
  relMap R := Empty.elim R

/-- **3.2.** The topos of functors from finite sets to sets classifies objects. -/
theorem isClassifyingSite_genericObject :
    IsClassifyingSite objectTheory.{u} ⊥ genericObject.{u} :=
  sorry

/-- **3.3.** The function symbols of the language of `G`-sets: one unary symbol for each element
of `G`. -/
def torsorFunctions (G : Type u) : ℕ → Type u
  | 1 => G
  | _ => PEmpty

/-- **3.3.** The language of `G`-sets. -/
def torsorLanguage (G : Type u) : FirstOrder.Language.{u, u} :=
  ⟨torsorFunctions G, fun _ => PEmpty⟩

/-- **3.3.** The term `g · t`. -/
def torsorAct {G : Type u} {n : ℕ} (g : G) (t : (torsorLanguage G).Term (Fin n)) :
    (torsorLanguage G).Term (Fin n) :=
  FirstOrder.Language.Functions.apply₁ (g : (torsorLanguage G).Functions 1) t

/-- **3.3.** The theory of `G`-torsors: a left action (`1 · x = x`,
`(g * h) · x = g · (h · x)`), inhabited (`⊢ ∃ x, ⊤`), transitive (`⊢ ⋁_g g · x = y`) and free
(`g · x = h · x ⊢ ⊥` for `g ≠ h`). -/
def torsorTheory (G : Type u) [Group G] : GeometricTheory.{u} (torsorLanguage G) :=
  {⟨1, .top, .equal (torsorAct 1 (.var 0)) (.var 0)⟩} ∪
  Set.range (fun gh : G × G => ⟨1, .top,
    .equal (torsorAct (gh.1 * gh.2) (.var 0)) (torsorAct gh.1 (torsorAct gh.2 (.var 0)))⟩) ∪
  {⟨0, .top, .ex .top⟩} ∪
  {⟨2, .top, .iSup fun g : G => .equal (torsorAct g (.var 0)) (.var 1)⟩} ∪
  {σ | ∃ g h : G, g ≠ h ∧
    σ = ⟨1, .equal (torsorAct g (.var 0)) (torsorAct h (.var 0)), .bot⟩}

/-- **3.3.** The Yoneda embedding of `SingleObj G` into the topos of right `G`-sets. -/
noncomputable abbrev torsorYoneda (G : Type u) [Group G] :
    SingleObj G ⥤ Sheaf (⊥ : GrothendieckTopology (AsSmall.{u} (SingleObj G))) (Type u) :=
  AsSmall.up ⋙ yoneda ⋙ (sheafBotEquivalence (Type u)).inverse

/-- **3.3.** The generic `G`-torsor: `G` as a right `G`-set, the representable presheaf, with
`G` acting on the left by multiplication. -/
noncomputable def genericTorsor (G : Type u) [Group G] :
    CatStructure (torsorLanguage G)
      (Sheaf (⊥ : GrothendieckTopology (AsSmall.{u} (SingleObj G))) (Type u)) where
  carrier := (torsorYoneda G).obj (SingleObj.star G)
  funMap {k} f := match k, f with
    | 1, g => Pi.π (fun _ : Fin 1 => (torsorYoneda G).obj (SingleObj.star G)) 0 ≫
        (torsorYoneda G).map (g : SingleObj.star G ⟶ SingleObj.star G)
  relMap R := PEmpty.elim R

/-- **3.3.** The topos of right `G`-sets classifies `G`-torsors. -/
theorem isClassifyingSite_genericTorsor (G : Type u) [Group G] :
    IsClassifyingSite (torsorTheory G) ⊥ (genericTorsor G) :=
  sorry

/-- **3.3.** The theories of `G`-torsors and of `H`-torsors are Morita-equivalent exactly when
`G` and `H` are isomorphic. -/
theorem moritaEquivalent_torsorTheory_iff (G H : Type u) [Group G] [Group H] :
    MoritaEquivalent (torsorTheory G) (torsorTheory H) ↔ Nonempty (G ≃* H) :=
  sorry

/-- **3.4.** The language of intervals: two constants `0` (`false`) and `1` (`true`) and a
binary relation `≤`. -/
def intervalLanguage : FirstOrder.Language.{0, 0} :=
  ⟨fun | 0 => Bool | _ => Empty, fun | 2 => Unit | _ => Empty⟩

/-- **3.4.** The constant `0` (for `false`) or `1` (for `true`). -/
def intervalConst {n : ℕ} (b : Bool) : intervalLanguage.Term (Fin n) :=
  FirstOrder.Language.Term.func (l := 0) (b : intervalLanguage.Functions 0) Fin.elim0

/-- **3.4.** The atomic formula `t ≤ s`. -/
def intervalLE {n : ℕ} (t s : intervalLanguage.Term (Fin n)) :
    GeometricFormula.{u} intervalLanguage n :=
  .rel (k := 2) (() : intervalLanguage.Relations 2) ![t, s]

/-- **3.4.** The theory of intervals: linear orders with a least element `0` and a greatest
element `1` such that `0 = 1 ⊢ ⊥`. -/
def intervalTheory : GeometricTheory.{u} intervalLanguage :=
  {⟨1, .top, intervalLE (.var 0) (.var 0)⟩,
   ⟨3, .and (intervalLE (.var 0) (.var 1)) (intervalLE (.var 1) (.var 2)),
     intervalLE (.var 0) (.var 2)⟩,
   ⟨2, .and (intervalLE (.var 0) (.var 1)) (intervalLE (.var 1) (.var 0)),
     .equal (.var 0) (.var 1)⟩,
   ⟨2, .top, .iSup fun b : ULift.{u} Bool =>
     if b.down then intervalLE (.var 0) (.var 1) else intervalLE (.var 1) (.var 0)⟩,
   ⟨1, .top, .and (intervalLE (intervalConst false) (.var 0))
     (intervalLE (.var 0) (intervalConst true))⟩,
   ⟨0, .equal (intervalConst false) (intervalConst true), .bot⟩}

/-- **3.4.** The Yoneda embedding of the simplex category into simplicial sets. -/
noncomputable abbrev simplexYoneda :
    SimplexCategory ⥤ Sheaf (⊥ : GrothendieckTopology (AsSmall.{u} SimplexCategory)) (Type u) :=
  AsSmall.up ⋙ yoneda ⋙ (sheafBotEquivalence (Type u)).inverse

open Simplicial in
/-- **3.4.** The standard `0`-simplex is terminal among simplicial sets. -/
noncomputable def isTerminalSimplexYonedaZero : IsTerminal (simplexYoneda.{u}.obj ⦋0⦌) :=
  IsTerminal.isTerminalObj (sheafBotEquivalence (Type u)).inverse _
    (IsTerminal.isTerminalObj yoneda _
      (IsTerminal.isTerminalObj
        (AsSmall.equiv : SimplexCategory ≌ AsSmall.{u} SimplexCategory).functor _
        SimplexCategory.isTerminalZero))

open Simplicial in
/-- **3.4.** The generic interval: the standard `1`-simplex `Δ[1]`, with `0` and `1` its two
vertices `δ 1` and `δ 0`, and `≤` the image of `(σ 0, σ 1) : Δ[2] ⟶ Δ[1] × Δ[1]`. -/
noncomputable def genericInterval :
    CatStructure intervalLanguage
      (Sheaf (⊥ : GrothendieckTopology (AsSmall.{u} SimplexCategory)) (Type u)) where
  carrier := simplexYoneda.obj ⦋1⦌
  funMap {k} f := match k, f with
    | 0, b => isTerminalSimplexYonedaZero.from _ ≫
        simplexYoneda.map (SimplexCategory.δ (if (show Bool from b) then 0 else 1))
  relMap {k} R := match k, R with
    | 2, () => Over.mk (Pi.lift fun i : Fin 2 => simplexYoneda.map (SimplexCategory.σ i))

/-- **3.4.** Simplicial sets classify intervals. -/
theorem isClassifyingSite_genericInterval :
    IsClassifyingSite intervalTheory.{u} ⊥ genericInterval.{u} :=
  sorry

/-! ## Layer 4: rings, local rings and the Zariski topos -/

/-- **4.1.** Finitely presented commutative rings, presented as `ℤ[X₁, …, Xₙ] / I` with `I`
finitely generated. -/
structure FPRing : Type u where
  /-- The number of generators. -/
  n : ℕ
  /-- The ideal of relations. -/
  I : Ideal (MvPolynomial (Fin n) ℤ)
  /-- The ideal of relations is finitely generated. -/
  fg : I.FG

/-- **4.1.** The ring presented by an object of `FPRing`, in `Type u`. -/
abbrev FPRing.Ring (A : FPRing.{u}) : Type u :=
  ULift.{u} (MvPolynomial (Fin A.n) ℤ ⧸ A.I)

/-- **4.1.** The small category of finitely presented commutative rings and ring maps. -/
noncomputable instance : SmallCategory FPRing.{u} where
  Hom A B := A.Ring →+* B.Ring
  id A := RingHom.id A.Ring
  comp f g := g.comp f

/-- **4.1.** The underlying set of a finitely presented ring. -/
noncomputable def FPRing.forget : FPRing.{u} ⥤ Type u where
  obj A := A.Ring
  map {A B} f := TypeCat.ofHom (show A.Ring →+* B.Ring from f)

/-- **4.1.** The ring operation of a function symbol of the language of rings on a finitely
presented ring. -/
noncomputable def ringOp (A : FPRing.{u}) {k : ℕ} (f : FirstOrder.Language.ring.Functions k)
    (x : Fin k → A.Ring) : A.Ring :=
  letI := FirstOrder.Ring.compatibleRingOfRing A.Ring
  FirstOrder.Language.Structure.funMap f x

/-- **4.1.** The forgetful functor as a presheaf on `FPRing.{u}ᵒᵖ`. -/
noncomputable abbrev forgetPresheaf : FPRing.{u}ᵒᵖᵒᵖ ⥤ Type u := unopUnop _ ⋙ FPRing.forget

/-- **4.1.** The generic ring as a presheaf: the forgetful functor with the pointwise ring
operations, through the comparison of a product of presheaves with the product of its values. -/
noncomputable def genericRingPresheaf :
    CatStructure FirstOrder.Language.ring (FPRing.{u}ᵒᵖᵒᵖ ⥤ Type u) where
  carrier := forgetPresheaf
  funMap {k} f :=
    { app := fun A => (piObjIso (fun _ : Fin k => forgetPresheaf.{u}) A).hom ≫
        (Types.productIso (fun _ : Fin k => forgetPresheaf.{u}.obj A)).hom ≫
        TypeCat.ofHom (fun x => ringOp A.unop.unop f x)
      naturality := by
        intro A B φ
        have eval : ∀ (C : FPRing.{u}ᵒᵖᵒᵖ) (y : (∏ᶜ fun _ : Fin k => forgetPresheaf.{u}).obj C)
            (i : Fin k), (Types.productIso (fun _ : Fin k => forgetPresheaf.{u}.obj C)).hom
              ((piObjIso (fun _ : Fin k => forgetPresheaf.{u}) C).hom y) i =
            (Pi.π (fun _ : Fin k => forgetPresheaf.{u}) i).app C y := by
          intro C y i
          rw [← piObjIso_hom_comp_π]
          rfl
        have hom : ∀ (x : Fin k → A.unop.unop.Ring),
            (show A.unop.unop.Ring →+* B.unop.unop.Ring from φ.unop.unop) (ringOp _ f x) =
              ringOp _ f (fun i => (show A.unop.unop.Ring →+* B.unop.unop.Ring from φ.unop.unop)
                (x i)) := by
          intro x
          cases f <;> simp [ringOp]
        ext x
        change ringOp _ f (fun i => (Types.productIso (fun _ : Fin k =>
            forgetPresheaf.{u}.obj B)).hom ((piObjIso (fun _ : Fin k => forgetPresheaf.{u}) B).hom
              ((∏ᶜ fun _ : Fin k => forgetPresheaf.{u}).map φ x)) i) =
          (show A.unop.unop.Ring →+* B.unop.unop.Ring from φ.unop.unop)
            (ringOp _ f (fun i => (Types.productIso (fun _ : Fin k =>
              forgetPresheaf.{u}.obj A)).hom ((piObjIso (fun _ : Fin k =>
                forgetPresheaf.{u}) A).hom x) i))
        simp only [eval]
        refine Eq.trans ?_ (hom _).symm
        congr 1
        funext i
        exact NatTrans.naturality_apply (Pi.π (fun _ : Fin k => forgetPresheaf.{u}) i) φ x }
  relMap R := Empty.elim R

/-- **4.1.** The generic commutative ring: the forgetful functor with the pointwise ring
operations, as a sheaf for the trivial topology on `FPRing.{u}ᵒᵖ`. -/
noncomputable def genericRing : CatStructure FirstOrder.Language.ring
    (Sheaf (⊥ : GrothendieckTopology FPRing.{u}ᵒᵖ) (Type u)) :=
  genericRingPresheaf.{u}.map (sheafBotEquivalence (Type u)).inverse

/-- **4.1.** A commutative ring that is finitely presentable in `CommRingCat` is a finitely
presented `ℤ`-algebra. -/
theorem finitePresentation_of_isFinitelyPresentable (S : CommRingCat.{u})
    (hS : IsFinitelyPresentable.{u} S) : Algebra.FinitePresentation ℤ S :=
  sorry

/-- **4.1.** The equation `t = s` in three variables, an axiom of commutative rings. -/
def ringEq (t s : FirstOrder.Language.ring.Term (Fin 3)) : Sequent.{u} FirstOrder.Language.ring :=
  ⟨3, .top, .equal t s⟩

/-- **4.1.** The equational theory of commutative rings. -/
def commRingTheory : GeometricTheory.{u} FirstOrder.Language.ring :=
  let x : FirstOrder.Language.ring.Term (Fin 3) := .var 0
  let y : FirstOrder.Language.ring.Term (Fin 3) := .var 1
  let z : FirstOrder.Language.ring.Term (Fin 3) := .var 2
  {ringEq (x + (y + z)) (x + y + z), ringEq (x + 0) x, ringEq (x + -x) 0, ringEq (x + y) (y + x),
    ringEq (x * (y * z)) (x * y * z), ringEq (x * 1) x, ringEq (x * y) (y * x),
    ringEq (x * (y + z)) (x * y + x * z)}

/-- **4.1.** Presheaves on the opposite of finitely presented rings classify commutative rings,
with the forgetful functor as generic ring. -/
theorem isClassifyingSite_genericRing :
    IsClassifyingSite commRingTheory.{u} ⊥ genericRing.{u} :=
  sorry

/-- **4.2.** The Zariski covering sieves on `A`: those containing, for each `f` in a finite
family generating the unit ideal, a map `A ⟶ B` making `B` a localization of `A` away from
`f`. -/
def zariskiCovers (A : FPRing.{u}ᵒᵖ) : Set (Sieve A) :=
  {S | ∃ s : Finset A.unop.Ring, Ideal.span (s : Set A.unop.Ring) = ⊤ ∧
    ∀ f ∈ s, ∃ (B : FPRing.{u}) (g : Opposite.op B ⟶ A), S.arrows g ∧
      letI := RingHom.toAlgebra (show A.unop.Ring →+* B.Ring from g.unop)
      IsLocalization.Away f B.Ring}

/-- **4.2.** The Zariski topology on the opposite of finitely presented rings: the smallest
Grothendieck topology for which the Zariski covering sieves cover. -/
noncomputable def zariskiTopology : GrothendieckTopology FPRing.{u}ᵒᵖ :=
  sInf {J | ∀ A, zariskiCovers A ⊆ J A}

/-- **4.2.** The forgetful functor is a sheaf for the Zariski topology. -/
theorem isSheaf_forget_zariskiTopology :
    Presheaf.IsSheaf zariskiTopology.{u} (unopUnop _ ⋙ FPRing.forget.{u}) :=
  sorry

/-- **4.3.** The theory of local rings: commutative rings with `0 = 1 ⊢ ⊥` and
`⊢ (∃ y, x * y = 1) ∨ (∃ y, (1 + -x) * y = 1)`. -/
def localRingTheory : GeometricTheory.{u} FirstOrder.Language.ring :=
  commRingTheory ∪
    {⟨0, .equal 0 1, .bot⟩,
     ⟨1, .top, .iSup fun b : ULift.{u} Bool => .ex (if b.down then .equal (.var 0 * .var 1) 1
       else .equal ((1 + -.var 0) * .var 1) 1)⟩}

/-- **4.3.** The Zariski topos classifies local rings, with the sheafified generic ring. -/
theorem isClassifyingSite_localRingTheory :
    IsClassifyingSite localRingTheory.{u} zariskiTopology
      (genericRing.{u}.map
        (sheafToPresheaf ⊥ (Type u) ⋙ presheafToSheaf zariskiTopology (Type u))) :=
  sorry

end TauCetiRoadmap.ClassifyingTopoi
