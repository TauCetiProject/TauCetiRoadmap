import Mathlib

/-!
# Grothendieck groups, Cartan maps, and Euler forms: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The declarations below force several load-bearing design choices and suggest Lean
forms for milestones; proving all of them would finish neither a layer nor the roadmap. `sorry` is
allowed in this human-owned roadmap library -- these are goals, not proofs.

In particular, `ShortComplex.Exact` is not used as the primitive notion of a Quillen conflation.
The first structure below retains witnesses for the actual kernel and cokernel universal
properties without assuming that the ambient category has all kernels or cokernels. The name
`IsConflationExact` is also deliberate: Mathlib's `CategoryTheory.exactFunctor` and `C ⥤ₑ D`
mean preservation of finite limits and colimits, a distinct notion outside the canonical exact
structures on abelian categories.
-/

namespace TauCetiRoadmap.GrothendieckEulerForms

open CategoryTheory CategoryTheory.Limits
open CategoryTheory.Pretriangulated
open scoped DirectSum TensorProduct

universe w v u

/-! ## Intrinsic exact structures -/

/-- The assertion that `X ⟶ Y ⟶ Z` is a kernel--cokernel pair.  The witnesses are local to this
pair: no global `HasKernel` or `HasCokernel` instance is assumed. -/
structure IsKernelCokernelPair {C : Type u} [Category.{v} C] [Preadditive C]
    {X Y Z : C} (i : X ⟶ Y) (p : Y ⟶ Z) where
  zero : i ≫ p = 0
  isLimitKernel : IsLimit (KernelFork.ofι i zero)
  isColimitCokernel : IsColimit (CokernelCofork.ofπ p zero)

/-- A concrete universal-property witness for a pushout square. -/
structure PushoutWitness {C : Type u} [Category.{v} C]
    {X Y X' Y' : C} (i : X ⟶ Y) (f : X ⟶ X') (g : Y ⟶ Y') (i' : X' ⟶ Y') where
  comm : i ≫ g = f ≫ i'
  desc : ∀ {T : C} (a : Y ⟶ T) (b : X' ⟶ T), i ≫ a = f ≫ b → (Y' ⟶ T)
  inl_desc : ∀ {T : C} (a : Y ⟶ T) (b : X' ⟶ T) (h),
    g ≫ desc a b h = a
  inr_desc : ∀ {T : C} (a : Y ⟶ T) (b : X' ⟶ T) (h),
    i' ≫ desc a b h = b
  hom_ext : ∀ {T : C} (a b : Y' ⟶ T), g ≫ a = g ≫ b → i' ≫ a = i' ≫ b → a = b

/-- A concrete universal-property witness for a pullback square. -/
structure PullbackWitness {C : Type u} [Category.{v} C]
    {X' Y' X Y : C} (i' : X' ⟶ Y') (g : X' ⟶ X) (f : Y' ⟶ Y) (p : X ⟶ Y) where
  comm : i' ≫ f = g ≫ p
  lift : ∀ {T : C} (a : T ⟶ Y') (b : T ⟶ X), a ≫ f = b ≫ p → (T ⟶ X')
  lift_fst : ∀ {T : C} (a : T ⟶ Y') (b : T ⟶ X) (h),
    lift a b h ≫ i' = a
  lift_snd : ∀ {T : C} (a : T ⟶ Y') (b : T ⟶ X) (h),
    lift a b h ≫ g = b
  hom_ext : ∀ {T : C} (a b : T ⟶ X'), a ≫ i' = b ≫ i' → a ≫ g = b ≫ g → a = b

/-- The distinguished kernel--cokernel pairs underlying an exact structure. -/
structure ConflationClass (C : Type u) [Category.{v} C] [Preadditive C] where
  Conflation : ∀ {X Y Z : C}, (X ⟶ Y) → (Y ⟶ Z) → Prop
  kernelCokernel : ∀ {X Y Z : C} {i : X ⟶ Y} {p : Y ⟶ Z},
    Conflation i p → IsKernelCokernelPair i p

namespace ConflationClass

variable {C : Type u} [Category.{v} C] [Preadditive C]

def IsInflation (E : ConflationClass C) {X Y : C} (i : X ⟶ Y) : Prop :=
  ∃ (Z : C) (p : Y ⟶ Z), E.Conflation i p

def IsDeflation (E : ConflationClass C) {Y Z : C} (p : Y ⟶ Z) : Prop :=
  ∃ (X : C) (i : X ⟶ Y), E.Conflation i p

end ConflationClass

/-- Quillen exact-category data in the self-dual E0/E1/E2 presentation.  The E2 fields return
genuine universal squares, so their statements cannot be satisfied by merely naming vacuous
propositions. -/
structure ExactStructure (C : Type u) [Category.{v} C] [Preadditive C]
    [HasZeroObject C] [HasBinaryBiproducts C] where
  toConflationClass : ConflationClass C
  iso_closed : ∀ {X Y Z X' Y' Z' : C} {i : X ⟶ Y} {p : Y ⟶ Z}
    (eX : X ≅ X') (eY : Y ≅ Y') (eZ : Z ≅ Z'),
    toConflationClass.Conflation i p →
      toConflationClass.Conflation (eX.inv ≫ i ≫ eY.hom) (eY.inv ≫ p ≫ eZ.hom)
  E0 : ∀ X : C, toConflationClass.IsInflation (𝟙 X)
  E0op : ∀ X : C, toConflationClass.IsDeflation (𝟙 X)
  E1 : ∀ {X Y Z : C} {i : X ⟶ Y} {j : Y ⟶ Z},
    toConflationClass.IsInflation i → toConflationClass.IsInflation j →
      toConflationClass.IsInflation (i ≫ j)
  E1op : ∀ {X Y Z : C} {p : X ⟶ Y} {q : Y ⟶ Z},
    toConflationClass.IsDeflation p → toConflationClass.IsDeflation q →
      toConflationClass.IsDeflation (p ≫ q)
  E2 : ∀ {X Y : C} {i : X ⟶ Y}, toConflationClass.IsInflation i →
    ∀ {X' : C} (f : X ⟶ X'), ∃ (Y' : C) (g : Y ⟶ Y') (i' : X' ⟶ Y'),
      Nonempty (PushoutWitness i f g i') ∧ toConflationClass.IsInflation i'
  E2op : ∀ {X Y : C} {p : X ⟶ Y}, toConflationClass.IsDeflation p →
    ∀ {Y' : C} (f : Y' ⟶ Y), ∃ (X' : C) (i' : X' ⟶ Y') (g : X' ⟶ X),
      Nonempty (PullbackWitness i' g f p) ∧ toConflationClass.IsDeflation i'

namespace ExactStructure

variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C]
  [HasBinaryBiproducts C]

abbrev Conflation (E : ExactStructure C) {X Y Z : C} (i : X ⟶ Y) (p : Y ⟶ Z) : Prop :=
  E.toConflationClass.Conflation i p

abbrev IsInflation (E : ExactStructure C) {X Y : C} (i : X ⟶ Y) : Prop :=
  E.toConflationClass.IsInflation i

abbrev IsDeflation (E : ExactStructure C) {X Y : C} (p : X ⟶ Y) : Prop :=
  E.toConflationClass.IsDeflation p

/-- The split exact structure; it is not identified with an abelian category's canonical exact
structure. -/
noncomputable def split (C : Type u) [Category.{v} C] [Preadditive C]
    [HasZeroObject C] [HasBinaryBiproducts C] : ExactStructure C := sorry

/-- The canonical exact structure on an abelian category. -/
noncomputable def abelian (C : Type u) [Category.{v} C] [Abelian C] : ExactStructure C := sorry

end ExactStructure

/-- Preservation of distinguished Quillen conflations.  The longer name prevents collision with
Mathlib's finite-limit-and-colimit notion of exact functor. -/
structure ExactStructure.IsConflationExact
    {C : Type u} {D : Type w} [Category.{v} C] [Preadditive C] [HasZeroObject C]
    [HasBinaryBiproducts C] [Category.{v} D] [Preadditive D] [HasZeroObject D]
    [HasBinaryBiproducts D]
    (E : ExactStructure C) (E' : ExactStructure D) (F : C ⥤ D) [F.Additive] : Prop where
  map_conflation : ∀ {X Y Z : C} {i : X ⟶ Y} {p : Y ⟶ Z}, E.Conflation i p →
    E'.Conflation (F.map i) (F.map p)

/-! ## A small presentation of exact K-zero -/

section ExactK0

variable {C : Type u} [Category.{v} C] [Preadditive C] [HasZeroObject C]
  [HasBinaryBiproducts C]
  [EssentiallySmall.{w} C]

/-- Small codes for isomorphism classes of objects.  The class map below is the only public entry
point; users never choose skeleton representatives. -/
abbrev ObjectCode (C : Type u) [Category.{v} C] [EssentiallySmall.{w} C] :=
  Shrink.{w} (Skeleton C)

noncomputable def objectCode (X : C) : ObjectCode C := sorry

/-- The relation imposed by a conflation.  The morphisms only fix the three objects, so they are
underscored; the relation itself is a statement about `[X]`, `[Y]` and `[Z]`. -/
noncomputable def exactRelation (_E : ExactStructure C) {X Y Z : C}
    (_i : X ⟶ Y) (_p : Y ⟶ Z) : FreeAbelianGroup (ObjectCode C) :=
  FreeAbelianGroup.of (objectCode Y) - FreeAbelianGroup.of (objectCode X) -
    FreeAbelianGroup.of (objectCode Z)

noncomputable def exactRelations (E : ExactStructure C) :
    AddSubgroup (FreeAbelianGroup (ObjectCode C)) :=
  AddSubgroup.closure {r | ∃ (X Y Z : C) (i : X ⟶ Y) (p : Y ⟶ Z),
    E.Conflation i p ∧ r = exactRelation E i p}

/-- Exact K-zero as a quotient of a genuinely small free abelian group. -/
noncomputable def ExactK0 (E : ExactStructure C) : Type w :=
  FreeAbelianGroup (ObjectCode C) ⧸ exactRelations E

noncomputable instance (E : ExactStructure C) : AddCommGroup (ExactK0 E) := by
  dsimp [ExactK0]
  infer_instance

noncomputable def exactK0Class (E : ExactStructure C) (X : C) : ExactK0 E :=
  QuotientAddGroup.mk' (exactRelations E) (FreeAbelianGroup.of (objectCode X))

theorem exactK0_conflation (E : ExactStructure C) {X Y Z : C}
    {i : X ⟶ Y} {p : Y ⟶ Z} (h : E.Conflation i p) :
    exactK0Class E Y = exactK0Class E X + exactK0Class E Z := sorry

/-- Object-valued data satisfying exactly the relations used in exact K-zero. -/
structure ConflationAdditiveInvariant (E : ExactStructure C) (G : Type*) [AddCommGroup G] where
  obj : C → G
  map_iso : ∀ {X Y : C}, (X ≅ Y) → obj X = obj Y
  map_conflation : ∀ {X Y Z : C} {i : X ⟶ Y} {p : Y ⟶ Z},
    E.Conflation i p → obj Y = obj X + obj Z

noncomputable def exactK0Lift (E : ExactStructure C) {G : Type*} [AddCommGroup G]
    (a : ConflationAdditiveInvariant E G) : ExactK0 E →+ G := sorry

theorem exactK0Lift_class (E : ExactStructure C) {G : Type*} [AddCommGroup G]
    (a : ConflationAdditiveInvariant E G) (X : C) :
    exactK0Lift E a (exactK0Class E X) = a.obj X := sorry

theorem exactK0Lift_unique (E : ExactStructure C) {G : Type*} [AddCommGroup G]
    (a : ConflationAdditiveInvariant E G) (f : ExactK0 E →+ G)
    (hf : ∀ X, f (exactK0Class E X) = a.obj X) : f = exactK0Lift E a := sorry

variable {D : Type w} [Category.{v} D] [Preadditive D] [HasZeroObject D]
  [HasBinaryBiproducts D]
  [EssentiallySmall.{w} D]

/-- Functoriality for a functor preserving distinguished conflations. -/
noncomputable def exactK0Map {E : ExactStructure C} {E' : ExactStructure D} (F : C ⥤ D)
    [F.Additive] (hF : E.IsConflationExact E' F) : ExactK0 E →+ ExactK0 E' := sorry

theorem exactK0Map_class {E : ExactStructure C} {E' : ExactStructure D} (F : C ⥤ D)
    [F.Additive] (hF : E.IsConflationExact E' F) (X : C) :
    exactK0Map F hF (exactK0Class E X) = exactK0Class E' (F.obj X) := sorry

end ExactK0

/-! ## Triangulated K-zero -/

section TriangulatedK0

variable (C : Type u) [Category.{v} C] [Preadditive C] [HasZeroObject C]
  [HasShift C ℤ] [∀ n : ℤ, (shiftFunctor C n).Additive]
  [Pretriangulated C] [EssentiallySmall.{w} C]

/-- The quotient by distinguished-triangle relations. Its construction reuses the small
presentation underlying `ExactK0`. -/
noncomputable def TriangulatedK0 (C : Type u) [Category.{v} C] [Preadditive C]
    [HasZeroObject C] [HasShift C ℤ] [∀ n : ℤ, (shiftFunctor C n).Additive]
    [Pretriangulated C] [EssentiallySmall.{w} C] : Type w := sorry

noncomputable instance : AddCommGroup (TriangulatedK0 C) := sorry

noncomputable def triangulatedK0Class (X : C) : TriangulatedK0 C := sorry

theorem triangulatedK0_triangle (T : Triangle C) (hT : T ∈ distTriang C) :
    triangulatedK0Class C T.obj₂ =
      triangulatedK0Class C T.obj₁ + triangulatedK0Class C T.obj₃ := sorry

theorem triangulatedK0_shift (X : C) :
    triangulatedK0Class C (X⟦(1 : ℤ)⟧) = -triangulatedK0Class C X := sorry

end TriangulatedK0

/-! ## Cartan maps and finite resolutions -/

/-- A recursive finite resolution of `X` by objects in the image of `F`; each step records an
actual conflation. -/
inductive AdmitsFiniteResolutionAlong
    {P : Type u} {C : Type w} [Category.{v} P] [Category.{v} C] [Preadditive C]
    [HasZeroObject C] [HasBinaryBiproducts C]
    (E : ExactStructure C) (F : P ⥤ C) : C → Prop
  | of_iso (Q : P) {X : C} (e : F.obj Q ≅ X) : AdmitsFiniteResolutionAlong E F X
  | step {K X : C} (Q : P) (i : K ⟶ F.obj Q) (p : F.obj Q ⟶ X)
      (hp : E.Conflation i p) (hK : AdmitsFiniteResolutionAlong E F K) :
      AdmitsFiniteResolutionAlong E F X

/-- The complete categorical hypotheses used by the finite-resolution comparison.  Besides finite
resolutions, implementations add the repleteness, extension, and admissible-kernel closure API
spelled out in `README.md`; the two closure fields below force those hypotheses to be data rather
than prose. -/
structure IsResolvingInclusion
    {P : Type u} {C : Type w} [Category.{v} P] [Preadditive P] [HasZeroObject P]
    [HasBinaryBiproducts P] [Category.{v} C] [Preadditive C] [HasZeroObject C]
    [HasBinaryBiproducts C]
    (EP : ExactStructure P) (E : ExactStructure C) (F : P ⥤ C) [F.Additive] : Prop where
  fullyFaithful : Nonempty F.FullyFaithful
  conflation_exact : EP.IsConflationExact E F
  reflects_conflations : ∀ {X Y Z : P} {i : X ⟶ Y} {p : Y ⟶ Z},
    E.Conflation (F.map i) (F.map p) → EP.Conflation i p
  extension_closed : ∀ {X Z : P} {Y : C} {i : F.obj X ⟶ Y} {p : Y ⟶ F.obj Z},
    E.Conflation i p → ∃ Y' : P, Nonempty (F.obj Y' ≅ Y)
  kernel_closed : ∀ {X Y : P} (p : F.obj X ⟶ F.obj Y), E.IsDeflation p →
    ∃ (K : P) (i : F.obj K ⟶ F.obj X), ∃ q : F.obj X ⟶ F.obj Y, q = p ∧ E.Conflation i q
  finite_resolution : ∀ X : C, AdmitsFiniteResolutionAlong E F X

section ResolutionComparison

variable {P : Type u} {C : Type w} [Category.{v} P] [Preadditive P] [HasZeroObject P]
  [HasBinaryBiproducts P] [EssentiallySmall.{w} P] [Category.{v} C] [Preadditive C]
  [HasZeroObject C] [HasBinaryBiproducts C]
  [EssentiallySmall.{w} C]

/-- The Cartan map is the K-zero map of the inclusion from projectives with their split exact
structure to modules with their canonical exact structure. -/
noncomputable def cartanMap {EP : ExactStructure P} {E : ExactStructure C} (F : P ⥤ C)
    [F.Additive] (hF : EP.IsConflationExact E F) : ExactK0 EP →+ ExactK0 E :=
  exactK0Map F hF

/-- The finite-resolution theorem: under the resolving hypotheses, the Cartan map is an
isomorphism; its inverse is the alternating class of any finite resolution. -/
noncomputable def resolutionComparison {EP : ExactStructure P} {E : ExactStructure C}
    (F : P ⥤ C) [F.Additive] (hF : IsResolvingInclusion EP E F) :
    ExactK0 EP ≃+ ExactK0 E := sorry

end ResolutionComparison

/-! ## Ext finiteness, Euler descent, and numerical quotients -/

section ExtEuler

variable (k : Type*) [Field k] (C : Type u) [Category.{v} C] [Abelian C] [Linear k C]
  [HasExt.{v} C]

/-- Euler admissibility records termwise finite-dimensionality and eventual vanishing separately.
The second field is not weakened to summability of Mathlib's totalized `finsum`. -/
structure ExtEulerFinite (P Q : C → Prop) : Prop where
  finiteDimensional : ∀ (X Y : C) (n : ℕ), P X → Q Y →
    FiniteDimensional k (Abelian.Ext X Y n)
  eventuallyZero : ∀ (X Y : C), P X → Q Y →
    ∃ N : ℕ, ∀ n ≥ N, Subsingleton (Abelian.Ext X Y n)

variable {k C}

noncomputable def extEulerValue {P Q : C → Prop} (h : ExtEulerFinite k C P Q)
    {X Y : C} (hX : P X) (hY : Q Y) : ℤ := sorry

/-- After long-exact-sequence additivity is proved in both variables, the Ext-Euler value descends
to the Grothendieck groups of the two *selected* subcategories -- not to a `K₀` of all of `C`, and
not under a hypothesis such as `∀ X, P X`, which would make the object properties vacuous. Each
side supplies its own exact category together with a functor into `C` landing in the relevant
property; additivity is proved from the long exact Ext sequences of the conflations there. -/
noncomputable def extEulerPairing {P Q : C → Prop} (h : ExtEulerFinite k C P Q)
    {CP CQ : Type u}
    [Category.{v} CP] [Preadditive CP] [HasZeroObject CP] [HasBinaryBiproducts CP]
    [EssentiallySmall.{w} CP]
    [Category.{v} CQ] [Preadditive CQ] [HasZeroObject CQ] [HasBinaryBiproducts CQ]
    [EssentiallySmall.{w} CQ]
    (EP : ExactStructure CP) (EQ : ExactStructure CQ) (iP : CP ⥤ C) (iQ : CQ ⥤ C)
    (hiP : ∀ X, P (iP.obj X)) (hiQ : ∀ Y, Q (iQ.obj Y)) :
    ExactK0 EP →+ ExactK0 EQ →+ ℤ := sorry

/-- The descent is characterized by its values on object classes; without this the definition
above would say nothing. -/
theorem extEulerPairing_class {P Q : C → Prop} (h : ExtEulerFinite k C P Q)
    {CP CQ : Type u}
    [Category.{v} CP] [Preadditive CP] [HasZeroObject CP] [HasBinaryBiproducts CP]
    [EssentiallySmall.{w} CP]
    [Category.{v} CQ] [Preadditive CQ] [HasZeroObject CQ] [HasBinaryBiproducts CQ]
    [EssentiallySmall.{w} CQ]
    (EP : ExactStructure CP) (EQ : ExactStructure CQ) (iP : CP ⥤ C) (iQ : CQ ⥤ C)
    (hiP : ∀ X, P (iP.obj X)) (hiQ : ∀ Y, Q (iQ.obj Y)) (X : CP) (Y : CQ) :
    extEulerPairing h EP EQ iP iQ hiP hiQ (exactK0Class EP X) (exactK0Class EQ Y) =
      extEulerValue h (hiP X) (hiQ Y) := sorry

end ExtEuler

section Radicals

variable {L R : Type*} [AddCommGroup L] [AddCommGroup R]

/-- The left radical of a possibly nonsymmetric biadditive pairing. -/
def leftRadical (b : L →+ R →+ ℤ) : AddSubgroup L where
  carrier := {x | ∀ y, b x y = 0}
  zero_mem' := by simp
  add_mem' := by
    intro x y hx hy z
    simp [hx z, hy z]
  neg_mem' := by
    intro x hx y
    simp [hx y]

/-- The right radical is a separate definition, not an alias for the left radical. -/
def rightRadical (b : L →+ R →+ ℤ) : AddSubgroup R where
  carrier := {y | ∀ x, b x y = 0}
  zero_mem' := by simp
  add_mem' := by
    intro x y hx hy z
    simp [hx z, hy z]
  neg_mem' := by
    intro x hx y
    simp [hx y]

abbrev LeftNumericalQuotient (b : L →+ R →+ ℤ) := L ⧸ leftRadical b
abbrev RightNumericalQuotient (b : L →+ R →+ ℤ) := R ⧸ rightRadical b

end Radicals

/-! ## Laurent coefficients and the q-Euler form -/

abbrev Laurent := LaurentPolynomial ℤ

/-- Evaluation at `q = 1`; this exists without any ungraded category. -/
noncomputable def laurentEvalOne : Laurent →+* ℤ :=
  LaurentPolynomial.eval₂ (RingHom.id ℤ) (1 : ℤˣ)

/-- The always-defined algebraic specialization of a Laurent module at `q = 1`. -/
noncomputable def SpecializeAtOne (M : Type*) [AddCommGroup M] [Module Laurent M] := by
  letI : Algebra Laurent ℤ := laurentEvalOne.toAlgebra
  exact ℤ ⊗[Laurent] M

noncomputable instance (M : Type*) [AddCommGroup M] [Module Laurent M] :
    AddCommGroup (SpecializeAtOne M) := by
  dsimp [SpecializeAtOne]
  infer_instance

/-- An additive map is balanced for evaluation at one exactly when it can factor through the
algebraic specialization. -/
def IsEvalOneLinear {M N : Type*} [AddCommGroup M] [Module Laurent M] [AddCommGroup N]
    (f : M →+ N) : Prop :=
  ∀ r x, f (r • x) = laurentEvalOne r • f x

/-- The factor through algebraic specialization; bijectivity is a further theorem, not built in. -/
noncomputable def specializeAtOneLift {M N : Type*} [AddCommGroup M] [Module Laurent M]
    [AddCommGroup N] (f : M →+ N) (hf : IsEvalOneLinear f) :
    SpecializeAtOne M →+ N := sorry

/-- Data needed even to formulate comparison of a graded exact category with an ungraded one. -/
structure ForgetGradingData
    {Cg : Type u} {Cu : Type w}
    [Category.{v} Cg] [Preadditive Cg] [HasZeroObject Cg] [HasBinaryBiproducts Cg]
    [Category.{v} Cu] [Preadditive Cu] [HasZeroObject Cu] [HasBinaryBiproducts Cu]
    (Eg : ExactStructure Cg) (Eu : ExactStructure Cu) (shift : Cg ⥤ Cg)
    [shift.Additive] [shift.IsEquivalence] where
  shift_exact : Eg.IsConflationExact Eg shift
  forget : Cg ⥤ Cu
  [forget_additive : forget.Additive]
  forget_exact : Eg.IsConflationExact Eu forget
  forget_shift : shift ⋙ forget ≅ forget

namespace ForgetGradingData

variable {Cg : Type u} {Cu : Type w}
variable [Category.{v} Cg] [Preadditive Cg] [HasZeroObject Cg] [HasBinaryBiproducts Cg]
variable [Category.{v} Cu] [Preadditive Cu] [HasZeroObject Cu] [HasBinaryBiproducts Cu]
variable {Eg : ExactStructure Cg} {Eu : ExactStructure Cu} {shift : Cg ⥤ Cg}
variable [shift.Additive] [shift.IsEquivalence]

/-- The map before imposing `q = 1`; its factorization uses `forget_shift`. -/
noncomputable def k0Map (D : ForgetGradingData Eg Eu shift)
    [EssentiallySmall.{w} Cg] [EssentiallySmall.{w} Cu] :
    ExactK0 Eg →+ ExactK0 Eu :=
  letI : D.forget.Additive := D.forget_additive
  exactK0Map D.forget D.forget_exact

/-- Even after the shift-forgetting factorization, comparison with ungraded K-zero is an
isomorphism only when this explicit predicate is proved. -/
def InducesQOneK0Equivalence (D : ForgetGradingData Eg Eu shift)
    [EssentiallySmall.{w} Cg] [EssentiallySmall.{w} Cu]
    [Module Laurent (ExactK0 Eg)] (h : IsEvalOneLinear D.k0Map) : Prop :=
  Function.Bijective (specializeAtOneLift D.k0Map h)

end ForgetGradingData

/-- The additional Ext comparison needed to identify evaluation of q-Euler with ungraded Euler.
The eventual categorical version also requires naturality for connecting maps. -/
structure GradedUngradedExtComparison (k : Type*) [Field k]
    {Mgr Mun : Type*} (U : Mgr → Mun)
    (Vgr : Mgr → Mgr → ℕ → ℤ → Type*) (Vun : Mun → Mun → ℕ → Type*)
    [∀ X Y n j, AddCommGroup (Vgr X Y n j)]
    [∀ X Y n j, Module k (Vgr X Y n j)]
    [∀ X Y n, AddCommGroup (Vun X Y n)] [∀ X Y n, Module k (Vun X Y n)] where
  finiteInternalSupport : ∀ X Y n, ∃ s : Finset ℤ,
    ∀ j, j ∉ s → Subsingleton (Vgr X Y n j)
  comparison : ∀ X Y n, (⨁ j : ℤ, Vgr X Y n j) ≃ₗ[k] Vun (U X) (U Y) n

/-- Mathlib's existing `q ↦ q⁻¹` automorphism, exposed as a ring hom for semilinear maps. -/
noncomputable abbrev laurentBar : Laurent →+* Laurent :=
  (LaurentPolynomial.invert : Laurent ≃ₐ[ℤ] Laurent).toRingEquiv.toRingHom

/-- A q-Euler form is semilinear through `LaurentPolynomial.invert` in its first argument and
linear in its second. This consumes Mathlib's sesquilinear infrastructure rather than defining a
private bar operation. -/
abbrev QEulerForm (M : Type*) [AddCommGroup M] [Module Laurent M] :=
  M →ₛₗ[laurentBar] M →ₗ[Laurent] Laurent

/-- Finite Laurent support and finite cohomological support are separate inputs to construction of
the q-Euler form, just as finite-dimensionality and eventual Ext-vanishing are separate above.
Here `V X Y n j` denotes the target-shift piece `Ext^n(X,Y{j})`, whose coefficient in the pinned
graded dimension is `q⁻ʲ`; source-shift indexing gives the equivalent positive-exponent formula. -/
structure GradedEulerFinite (k : Type*) [Field k] (M : Type*)
    (V : M → M → ℕ → ℤ → Type*)
    [∀ X Y n j, AddCommGroup (V X Y n j)] [∀ X Y n j, Module k (V X Y n j)] : Prop where
  finiteDimensional : ∀ X Y n j, FiniteDimensional k (V X Y n j)
  finiteLaurentSupport : ∀ X Y n, ∃ s : Finset ℤ,
    ∀ j, j ∉ s → Subsingleton (V X Y n j)
  finiteCohomologicalSupport : ∀ X Y, ∃ N : ℕ,
    ∀ n ≥ N, ∀ j, Subsingleton (V X Y n j)

/-- Bundle object-level q-Euler values after the categorical construction has proved additivity and
the two shift identities.  `GradedEulerFinite` is what makes those values finite Laurent
polynomials; it cannot by itself imply any of the four equations below. -/
noncomputable def qEulerFormOfValues {M : Type*} [AddCommGroup M] [Module Laurent M]
    (χ : M → M → Laurent)
    (add_left : ∀ x x' y, χ (x + x') y = χ x y + χ x' y)
    (smul_left : ∀ r x y, χ (r • x) y = laurentBar r * χ x y)
    (add_right : ∀ x y y', χ x (y + y') = χ x y + χ x y')
    (smul_right : ∀ r x y, χ x (r • y) = r * χ x y) : QEulerForm M := sorry

theorem laurentBar_T (n : ℤ) : laurentBar (LaurentPolynomial.T n) = LaurentPolynomial.T (-n) := by
  simp [laurentBar]

/-! ## The orientation-sensitive `A₂` acceptance check -/

def a2Euler (x y : Fin 2 → ℤ) : ℤ :=
  x 0 * y 0 + x 1 * y 1 - x 0 * y 1

def a2SimpleOne : Fin 2 → ℤ := ![1, 0]
def a2SimpleTwo : Fin 2 → ℤ := ![0, 1]
def a2ProjectiveOne : Fin 2 → ℤ := ![1, 1]
def a2ProjectiveTwo : Fin 2 → ℤ := ![0, 1]

/-- For left modules over `1 ⟶ 2`, the off-diagonal entry is in row `S₁`, column `S₂`.
Reversing the arrow or silently switching to right modules makes this check fail. -/
example : a2Euler a2SimpleOne a2SimpleTwo = -1 := by decide

example : a2Euler a2ProjectiveOne a2SimpleOne = 1 := by decide
example : a2Euler a2ProjectiveOne a2SimpleTwo = 0 := by decide
example : a2Euler a2ProjectiveTwo a2SimpleTwo = 1 := by decide

end TauCetiRoadmap.GrothendieckEulerForms
