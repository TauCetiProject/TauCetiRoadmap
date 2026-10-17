import Mathlib
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic
import TauCeti.CategoryTheory.Sites.ExtensionByZero
import Mathlib.Topology.Sheaves.Over

/-!
# DiamondEtaleCohomology: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These suggested forms record light definitions and milestone theorem signatures
statable against the pinned Mathlib and Tau Ceti APIs. Discharging them finishes neither a
layer nor the roadmap.

The statements use spectral spaces, module sheaves and complete nonarchimedean fields on the
library's carriers. The coefficient sites, enhanced étale categories, geometric operations,
compactifications and diamond dimension bounds are specified in the README. Field tower
and extension embeddings are explicitly isometric for compatible norms; point-presentation isomorphisms preserve
topology and valuation rings independently of normalization. Generating, independent and
modified degrees remain distinct.

Properness of v-stacks and its basic API are supplied by DiamondsAndVStacks §D4.11
and re-exported in C4.1. C4 supplies partial properness, valuative refinements and
canonical compactification using that imported predicate.

The analytic-to-diamond partial-properness comparison in C8.48a assumes taut preimages
of affinoid target opens. Its unrestricted field-pair predicate also applies without
that hypothesis to the analytic dimension formulas. Generic ringed-site replacements
and exact-functor coherence are supplied by EnhancedDerivedSheaves, §§0.1–0.4.

Ambient v-pushforward is a right adjoint at each adequate cutoff. The categorical
signatures below record its canonical comparison, the essential-image condition for
invertibility, and the coreflected formula for the intrinsic étale right adjoint.
The enhanced coherences and geometric hypotheses are specified in C2.9 and C3.1–C3.3.
-/

noncomputable section

open CategoryTheory Limits Topology TopologicalSpace

universe u v w

namespace TauCeti.DiamondEtale

/-! ## Layers C2–C3: cutoff mates and intrinsic pushforward -/

section CutoffPushforward
variable {C D C' D' : Type u}
    [Category.{v} C] [Category.{v} D] [Category.{v} C'] [Category.{v} D']
    {L : C ⥤ D} {R : D ⥤ C} {L' : C' ⥤ D'} {R' : D' ⥤ C'}
    (adj : L ⊣ R) (adj' : L' ⊣ R') (cC : C ⥤ C') (cD : D ⥤ D')
    (comm : L ⋙ cD ≅ cC ⋙ L')

/-- The cutoff comparison is the mate of the pullback square, with no invertibility
assumption. Its components are adjoint to the extended counit (C2.9). -/
def vPush_cutoffComparison : R ⋙ cC ⟶ cD ⋙ R' where
  app A := adj'.homEquiv (cC.obj (R.obj A)) (cD.obj A)
    ((comm.app (R.obj A)).inv ≫ cD.map (adj.counit.app A))
  naturality := by sorry

/-- For fully faithful cutoff extensions, the ambient comparison is invertible
exactly when the larger right-adjoint value lies in the smaller essential image (C2.9). -/
theorem vPush_cutoffComparison_isIso [cC.Full] [cC.Faithful] [cD.Full] [cD.Faithful]
    (A : D) :
    IsIso ((vPush_cutoffComparison adj adj' cC cD comm).app A) ↔
      cC.essImage (R'.obj (cD.obj A)) := by sorry

end CutoffPushforward

/-- Coreflecting a stagewise ambient right adjoint computes the intrinsic right
adjoint on a fully faithful subcategory, at every adequate cutoff (C3.3). -/
theorem push_coreflectionIso
    {C D E F : Type u} [Category.{v} C] [Category.{v} D]
    [Category.{v} E] [Category.{v} F]
    {L : C ⥤ D} {R : D ⥤ C} (adj : L ⊣ R)
    {i : E ⥤ C} {S : C ⥤ E} (corefl : i ⊣ S)
    {P : E ⥤ F} {Q : F ⥤ E} (intrinsic : P ⊣ Q)
    (j : F ⥤ D) [j.Full] [j.Faithful] (comm : i ⋙ L ≅ P ⋙ j) :
    Nonempty (Q ≅ j ⋙ R ⋙ S) := by sorry

/-! ## Topological open extension by zero -/

section OpenExtension
variable (Λ : Type u) [Ring Λ]

/-- Open extension by zero transports the canonical slice-site left adjoint to
sheaves on the open subspace, using the pinned generic construction. -/
def extendByZero {X : TopCat.{u}} (U : Opens X) :
    TopCat.Sheaf (ModuleCat.{u} Λ) (TopCat.of U) ⥤ TopCat.Sheaf (ModuleCat.{u} Λ) X :=
  U.sheafEquivOver.inverse ⋙
    (Over.forget U).sheafPullback (ModuleCat.{u} Λ)
      ((Opens.grothendieckTopology X).over U) (Opens.grothendieckTopology X)

/-- The open adapter is left adjoint to restriction to the open subspace. -/
theorem extendByZero_adjunction {X : TopCat.{u}} (U : Opens X) :
    Nonempty (extendByZero Λ U ⊣ U.sheafRestrict (C := ModuleCat.{u} Λ)) := by sorry

/-- Open extension by zero for module sheaves is exact over every ring. -/
theorem extendByZero_exact {X : TopCat.{u}} (U : Opens X) :
    PreservesFiniteLimits (extendByZero Λ U) ∧
      PreservesFiniteColimits (extendByZero Λ U) := by sorry

/-- At a point of the open, the extended sheaf has the original stalk. -/
theorem extendByZero_stalk_mem {X : TopCat.{u}} (U : Opens X)
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) (TopCat.of U)) (x : X) (hx : x ∈ U) :
    Nonempty (((extendByZero Λ U).obj F).presheaf.stalk x ≅
      F.presheaf.stalk ⟨x, hx⟩) := by sorry

/-- Outside the open, the extended sheaf has zero stalk. -/
theorem extendByZero_stalk_not_mem {X : TopCat.{u}} (U : Opens X)
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) (TopCat.of U)) (x : X) (hx : x ∉ U) :
    IsZero (((extendByZero Λ U).obj F).presheaf.stalk x) := by sorry

/-- Extension from the empty open is zero, including every stalk. -/
example {X : TopCat.{u}}
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) (TopCat.of (⊥ : Opens X))) :
    IsZero ((extendByZero Λ (⊥ : Opens X)).obj F) ∧
      ∀ x : X, IsZero (((extendByZero Λ (⊥ : Opens X)).obj F).presheaf.stalk x) := by
  sorry

/-- Restriction to the whole open followed by extension is naturally the identity. -/
example {X : TopCat.{u}} :
    Nonempty (((⊤ : Opens X).sheafRestrict (C := ModuleCat.{u} Λ) ⋙
      extendByZero Λ (⊤ : Opens X)) ≅ 𝟭 (TopCat.Sheaf (ModuleCat.{u} Λ) X)) := by
  sorry

end OpenExtension

/-- On Sierpiński space, extension of a nonzero constant value from the generic
singleton has zero closed stalk and global sections; direct image has that value
at the closed point and therefore differs from extension by zero. -/
example (Λ : Type) [Ring Λ] (M : ModuleCat.{0} Λ) [Nontrivial M] :
    let X := TopCat.of Prop
    let U : Opens X := ⟨{True}, isOpen_singleton_true⟩
    let F : TopCat.Sheaf (ModuleCat.{0} Λ) (TopCat.of U) :=
      (constantSheaf (Opens.grothendieckTopology U) (ModuleCat.{0} Λ)).obj M
    let j : TopCat.of U ⟶ X := TopCat.ofHom ⟨Subtype.val, continuous_subtype_val⟩
    let E := (extendByZero Λ U).obj F
    let D := (TopCat.Sheaf.pushforward (ModuleCat.{0} Λ) j).obj F
    Nonempty (F.presheaf.stalk ⟨True, Set.mem_singleton True⟩ ≅ M) ∧
      Nonempty (E.presheaf.stalk True ≅ M) ∧
      IsZero (E.presheaf.stalk False) ∧
      IsZero (E.presheaf.obj (Opposite.op (⊤ : Opens X))) ∧
      Nonempty (D.presheaf.stalk False ≅ M) ∧ ¬ Nonempty (E ≅ D) := by
  sorry

/-! ## Layer C5: relative valuation-space acyclicity -/

section ValuationCohomology
attribute [local instance] HasExt.standard

/-- The supplied spectrum of a discrete field with full plus ring is one point (C5.7). -/
example (K : Type u) [Field K] [TopologicalSpace K] [DiscreteTopology K] :
    Nonempty (TauCeti.ValuationSpectrum.spa (⊤ : Subring K)) ∧
      Subsingleton (TauCeti.ValuationSpectrum.spa (⊤ : Subring K)) := by sorry

/-- A proper valuation subring and the whole field give distinct points (C5.7). -/
example (K : Type u) [Field K] [TopologicalSpace K] [DiscreteTopology K]
    (V : ValuationSubring K) (hV : V ≠ ⊤) :
    ∃ x y : TauCeti.ValuationSpectrum.spa V.toSubring, x ≠ y := by sorry

/-- With V=K, restriction of every relative valuation ring is the whole base field (C5.7). -/
example (K K' : Type u) [Field K] [Field K'] [Algebra K K']
    [TopologicalSpace K'] [DiscreteTopology K']
    (x : TauCeti.ValuationSpectrum.spa ((⊤ : Subring K).map (algebraMap K K'))) :
    x.val.valuation.valuationSubring.comap (algebraMap K K') = ⊤ := by sorry

/-- Relative Zariski–Riemann acyclicity on the supplied spectrum (C5.7, ECD Lemma 19.4).
The special fibre consists of valuations whose valuation ring restricts to V. -/
theorem zariskiRiemannAcyclicity {K K' : Type u} [Field K] [Field K']
    [IsAlgClosed K] [IsAlgClosed K'] [Algebra K K']
    [TopologicalSpace K'] [DiscreteTopology K'] (V : ValuationSubring K)
    (F : TopCat.Sheaf AddCommGrpCat.{u}
      (TopCat.of (TauCeti.ValuationSpectrum.spa (V.toSubring.map (algebraMap K K')))))
    (htors : ∀ (x : TauCeti.ValuationSpectrum.spa (V.toSubring.map (algebraMap K K')))
      (s : F.presheaf.stalk x), IsOfFinAddOrder s)
    (hF : ∀ x : TauCeti.ValuationSpectrum.spa (V.toSubring.map (algebraMap K K')),
      x.val.valuation.valuationSubring.comap (algebraMap K K') = V →
        IsZero (F.presheaf.stalk x)) :
    ∀ n : ℕ, Subsingleton (Sheaf.H.{u+1} F n) := by sorry

end ValuationCohomology

/-! ## Layer C7: constructible sheaves on spectral spaces -/

section ConstructibleSheaves
variable (Λ : Type u) [Ring Λ]

/-- Restriction to Z is constant with a finitely generated module as value (C7.1). -/
def IsConstFGOn {X : TopCat.{u}} (F : TopCat.Sheaf (ModuleCat.{u} Λ) X) (Z : Set X) : Prop :=
  ∃ M : ModuleCat.{u} Λ, Module.Finite Λ M ∧
    Nonempty ((TopCat.Sheaf.pullback (ModuleCat.{u} Λ)
      (TopCat.ofHom ⟨Subtype.val, continuous_subtype_val⟩ : TopCat.of Z ⟶ X)).obj F ≅
      (constantSheaf (Opens.grothendieckTopology Z) (ModuleCat.{u} Λ)).obj M)

/-- A zero sheaf has zero finitely generated value on every subspace (C7.1). -/
example {X : TopCat.{u}} (F : TopCat.Sheaf (ModuleCat.{u} Λ) X) (hF : IsZero F)
    (Z : Set X) : IsConstFGOn Λ F Z := by sorry

/-- A constant finite free sheaf has finitely generated value on every subspace (C7.1). -/
example {X : TopCat.{u}} (n : ℕ) (Z : Set X) :
    IsConstFGOn Λ ((constantSheaf (Opens.grothendieckTopology X)
      (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ (Fin n → Λ))) Z := by sorry

/-- Infinite-rank free constant values fail finite generation on a nonempty space (C7.1). -/
example [Nontrivial Λ] (X : TopCat.{u}) [Nonempty X] :
    ¬ IsConstFGOn Λ ((constantSheaf (Opens.grothendieckTopology X)
      (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ (ℕ →₀ Λ))) Set.univ := by sorry

/-- DiamondEtaleCohomology:C7/constructible-sheaf-spectral (ECD Definition 20.1(i), Lemma 20.4):
a sheaf of Λ-modules on a spectral space is constructible if there is a finite stratification
`X = ⊔ Sᵢ` into constructible locally closed subsets such that each `F|_{Sᵢ}` (Mathlib pullback
along the subspace inclusion) is the constant sheaf of a finitely generated Λ-module. -/
def IsConstructibleSheaf [IsNoetherianRing Λ] {X : TopCat.{u}} [SpectralSpace X]
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) X) : Prop :=
  ∃ (n : ℕ) (Z : Fin n → Set X),
    (∀ i, Topology.IsConstructible (Z i) ∧ IsLocallyClosed (Z i)) ∧
    Pairwise (fun i j => Disjoint (Z i) (Z j)) ∧ (⋃ i, Z i) = Set.univ ∧
    ∀ i, ∃ M : ModuleCat.{u} Λ, Module.Finite Λ M ∧
      Nonempty ((TopCat.Sheaf.pullback (ModuleCat.{u} Λ) (TopCat.ofHom ⟨Subtype.val, continuous_subtype_val⟩)).obj F ≅
        (constantSheaf (Opens.grothendieckTopology (Z i)) (ModuleCat.{u} Λ)).obj M)

/-- C7/constructible-sheaf-spectral API: the constant sheaf of a finitely generated module is
constructible. -/
theorem IsConstructibleSheaf.constant [IsNoetherianRing Λ] (X : TopCat.{u}) [SpectralSpace X]
    (M : ModuleCat.{u} Λ) [Module.Finite Λ M] : IsConstructibleSheaf Λ ((constantSheaf (Opens.grothendieckTopology X) (ModuleCat.{u} Λ)).obj M) := by
  sorry

/-- C7/constructible-sheaf-spectral API: pullback along a spectral map preserves
constructibility. -/
theorem IsConstructibleSheaf.pullback [IsNoetherianRing Λ] {X Y : TopCat.{u}} [SpectralSpace X]
    [SpectralSpace Y] (f : X ⟶ Y) (hf : IsSpectralMap f) (F : TopCat.Sheaf (ModuleCat.{u} Λ) Y)
    (hF : IsConstructibleSheaf Λ F) :
    IsConstructibleSheaf Λ ((TopCat.Sheaf.pullback (ModuleCat.{u} Λ) f).obj F) := by
  sorry

/-- C7/constructible-sheaf-spectral API: constructible sheaves are closed under kernels,
cokernels and extensions (hence images, as kernels of cokernel maps). -/
theorem IsConstructibleSheaf.kernel_cokernel_extension [IsNoetherianRing Λ] (X : TopCat.{u})
    [SpectralSpace X] :
    let P : ObjectProperty (TopCat.Sheaf (ModuleCat.{u} Λ) X) := fun F => IsConstructibleSheaf Λ F
    P.IsClosedUnderKernels ∧ P.IsClosedUnderCokernels ∧ P.IsClosedUnderExtensions := by
  sorry

/-- DiamondEtaleCohomology:C7/constructible-compact-spectral (ECD Lemma 20.4): constructible
⇔ compact (`IsFinitelyPresentable`), and every sheaf is a filtered colimit of constructible
sheaves. -/
theorem constructibleCompactSpectral [IsNoetherianRing Λ] (X : TopCat.{u}) [SpectralSpace X] :
    (∀ F : TopCat.Sheaf (ModuleCat.{u} Λ) X, IsConstructibleSheaf Λ F ↔ IsFinitelyPresentable.{u} F) ∧
    ∀ F : TopCat.Sheaf (ModuleCat.{u} Λ) X,
      ∃ (J : Type u) (_ : SmallCategory J) (_ : IsFiltered J) (D : J ⥤ TopCat.Sheaf (ModuleCat.{u} Λ) X)
        (c : Cocone D) (_ : IsColimit c), Nonempty (c.pt ≅ F) ∧ ∀ j, IsConstructibleSheaf Λ (D.obj j) := by
  sorry

/-- test isConstructibleSheaf_zero (degenerate): the zero sheaf is constructible. -/
example [IsNoetherianRing Λ] {X : TopCat.{u}} [SpectralSpace X]
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) X) (hF : IsZero F) : IsConstructibleSheaf Λ F := by
  sorry

/-- test isConstructibleSheaf_constant (computation): the constant sheaf `Λⁿ` is constructible. -/
example [IsNoetherianRing Λ] {X : TopCat.{u}} [SpectralSpace X] (n : ℕ) :
    IsConstructibleSheaf Λ ((constantSheaf (Opens.grothendieckTopology X) (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ (Fin n → Λ))) := by
  sorry

/-- test isConstructibleSheaf_not_fg (non-example): for `Λ ≠ 0` and `X ≠ ∅`, the constant sheaf
with value `⊕_{n∈ℕ} Λ` is not constructible. -/
example [IsNoetherianRing Λ] [Nontrivial Λ] {X : TopCat.{u}} [SpectralSpace X] [Nonempty X] :
    ¬ IsConstructibleSheaf Λ ((constantSheaf (Opens.grothendieckTopology X) (ModuleCat.{u} Λ)).obj (ModuleCat.of Λ (ℕ →₀ Λ))) := by
  sorry

/-- isConstructibleSheaf_finite_T0: constructibility on a finite T0 spectral space
is finite generation of every stalk (C7.1). -/
example [IsNoetherianRing Λ] (X : TopCat.{u}) [Finite X] [SpectralSpace X]
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) X) :
    IsConstructibleSheaf Λ F ↔ ∀ x : X, Module.Finite Λ (F.presheaf.stalk x) := by sorry

/-- The stalk description of extension by zero on the punctured Cantor set
excludes constructibility (isConstructibleSheaf_not_qc_open, C7.1). -/
example [IsNoetherianRing Λ] [Nontrivial Λ]
    (X : TopCat.{u}) [SpectralSpace X] (e : X ≃ₜ (ℕ → Bool)) (x : X)
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) X)
    (hx : IsZero (F.presheaf.stalk x))
    (hU : ∀ y : X, y ≠ x →
      Nonempty (F.presheaf.stalk y ≅ ModuleCat.of Λ Λ)) :
    ¬ IsConstructibleSheaf Λ F := by sorry

end ConstructibleSheaves

/-- `F` has a finite filtration `0 = F₀ ⊂ F₁ ⊂ ⋯ ⊂ Fₙ ≅ F` whose graded pieces satisfy `P`. -/
def HasFiltrationBy {C : Type*} [Category* C] [Abelian C] (P : C → Prop) (F : C) : Prop :=
  ∃ (n : ℕ) (G : Fin (n + 1) → C) (m : ∀ i : Fin n, G i.castSucc ⟶ G i.succ),
    (∀ i, Mono (m i)) ∧ IsZero (G 0) ∧ Nonempty (G (Fin.last n) ≅ F) ∧ ∀ i, P (cokernel (m i))

/-- A zero object has the length-zero filtration (ECD Proposition 20.8). -/
example {C : Type u} [Category C] [Abelian C] (P : C → Prop) (F : C)
    (hF : IsZero F) : HasFiltrationBy P F := by sorry

/-- The length-one filtration has its single graded piece isomorphic to F (ECD Proposition 20.8). -/
example {C : Type u} [Category C] [Abelian C] (P : C → Prop) (F : C)
    (hF : P F) (hP : ObjectProperty.IsClosedUnderIsomorphisms (C := C) P) :
    HasFiltrationBy P F := by sorry

/-- A false graded-piece predicate permits exactly the zero objects (C7.11). -/
example {C : Type u} [Category C] [Abelian C] (F : C) :
    HasFiltrationBy (fun _ => False) F ↔ IsZero F := by sorry

/-! ## Layer C7: module Tor-amplitude checks -/

section ModuleTorChecks
attribute [local instance] HasDerivedCategory.standard
variable (Λ : Type u) [CommRing Λ]

/-- Degree-zero Tor with the unit recovers the module (C7.14). -/
example (M : ModuleCat.{u} Λ) :
    Nonempty ((((CategoryTheory.Tor (ModuleCat.{u} Λ) 0).obj M).obj
      (ModuleCat.of Λ Λ)) ≅ M) := by sorry

/-- Tensor with the unit has amplitude [0,0]: its positive Tor groups vanish (C7.14). -/
example (M : ModuleCat.{u} Λ) (n : ℕ) :
    IsZero (((CategoryTheory.Tor (ModuleCat.{u} Λ) (n + 1)).obj M).obj
      (ModuleCat.of Λ Λ)) := by sorry

/-- The shifted unit detects the cohomological sign of [1] (C7.14). -/
example [Nontrivial Λ] :
    let A := ((DerivedCategory.singleFunctor (ModuleCat.{u} Λ) 0).obj
      (ModuleCat.of Λ Λ))⟦(1 : ℤ)⟧
    Nonempty ((DerivedCategory.homologyFunctor (ModuleCat.{u} Λ) (-1)).obj A ≅
      ModuleCat.of Λ Λ) ∧
    ¬ IsZero ((DerivedCategory.homologyFunctor (ModuleCat.{u} Λ) (-1)).obj A) := by sorry

end ModuleTorChecks

/-- The dual-number quotient has nonzero Tor in every homological degree;
the periodic ε-resolution detects failure of any finite Tor interval (C7.14). -/
example (n : ℕ) :
    let R := DualNumber ℤ
    let M := ModuleCat.of R (R ⧸ Ideal.span ({DualNumber.eps} : Set R))
    ¬ IsZero (((CategoryTheory.Tor (ModuleCat R) n).obj M).obj M) := by sorry

/-! ## Layer C8: field degrees and cohomological bounds -/

section RelativeDimension
variable {X : Type u} {Y : Type v} [TopologicalSpace X]

/-- Homeomorphisms preserve the supplier AdicEtaleGeometry A2.6 `AdicSpace.relDim`,
written as its defining supremum of subspace fibre dimensions. -/
theorem relDim_homeomorph [TopologicalSpace Y]
    {X' : Type w} {Y' : Type w} [TopologicalSpace X'] [TopologicalSpace Y']
    (eX : X ≃ₜ X') (eY : Y ≃ₜ Y') (f : X → Y) (g : X' → Y')
    (h : ∀ x, g (eX x) = eY (f x)) :
    (⨆ y, topologicalKrullDim (f ⁻¹' {y})) =
      ⨆ y', topologicalKrullDim (g ⁻¹' {y'}) := by sorry

/-- The supplier relative dimension of an identity on a nonempty space is zero. -/
theorem relDim_id [Nonempty X] :
    (⨆ x, topologicalKrullDim ((id : X → X) ⁻¹' {x})) = 0 := by sorry

-- relDim_empty
example [IsEmpty X] (f : X → Y) :
    (⨆ y, topologicalKrullDim (f ⁻¹' {y})) = ⊥ := by sorry

-- relDim_toPoint
example : (⨆ y : PUnit, topologicalKrullDim ((fun _ : X => PUnit.unit) ⁻¹' {y})) =
    topologicalKrullDim X := by sorry

-- relDim_emptyTarget
example [IsEmpty X] :
    (⨆ x, topologicalKrullDim ((id : X → X) ⁻¹' {x})) = ⊥ := by sorry
end RelativeDimension

section DenseIntermediateFields
variable (K : Type u) (L : Type u) [Field K] [Field L] [Algebra K L]
variable [TopologicalSpace L]

/-- Infimum of finite algebraic transcendence bounds witnessed by a dense intermediate field. -/
def topologicalTrdeg (K L : Type u) [Field K] [Field L] [Algebra K L]
    [TopologicalSpace L] : ℕ∞ :=
  ⨅ (n : ℕ) (_ : ∃ A : IntermediateField K L,
      Dense (A : Set L) ∧ Algebra.trdeg K A ≤ (n : Cardinal)), (n : ℕ∞)

-- topologicalTrdeg_self_test
example [TopologicalSpace K] : topologicalTrdeg K K = 0 := by sorry

-- topologicalTrdeg_discrete_one
example [DiscreteTopology L] (h : Algebra.trdeg K L = 1) :
    topologicalTrdeg K L = 1 := by sorry

-- topologicalTrdeg_dense_algebraic
example (A : IntermediateField K L) [Algebra.IsAlgebraic K A]
    (hd : Dense (A : Set L)) : topologicalTrdeg K L = 0 := by sorry

-- topologicalTrdeg_discrete_infinite
example [DiscreteTopology L] (h : Cardinal.aleph0 ≤ Algebra.trdeg K L) :
    topologicalTrdeg K L = ⊤ := by sorry

variable {L} in
/-- `DiamondEtaleCohomology:C8/topological-independence-degree`, Temkin §2.1.6.
No element of `s` lies in the closure of the elements algebraic over the intermediate field
generated by the other elements. In a complete algebraically closed `L` that closure is the
completed algebraic closure, so this is Temkin's topgebraic independence. -/
def IsTopAlgIndependent (s : Set L) : Prop :=
  ∀ x ∈ s, x ∉ closure {y : L | IsAlgebraic (IntermediateField.adjoin K (s \ {x})) y}

/-- Temkin's independent degree `top.tr.deg`, through finite independent sets. -/
def topologicalIndependenceDegree : ℕ∞ :=
  ⨆ (s : Finset L) (_ : IsTopAlgIndependent K (s : Set L)), (s.card : ℕ∞)

/-- The identity extension has independent degree zero (C8.4). -/
example [TopologicalSpace K] : topologicalIndependenceDegree K K = 0 := by sorry

/-- Discrete transcendence degree one gives independent degree one (C8.4). -/
example [DiscreteTopology L] (h : Algebra.trdeg K L = 1) :
    topologicalIndependenceDegree K L = 1 := by sorry

-- isTopAlgIndependent_discrete
example [DiscreteTopology L] (s : Set L) :
    IsTopAlgIndependent K s ↔ AlgebraicIndependent K ((↑) : s → L) := by sorry

-- isTopAlgIndependent_singleton
example (x : L) :
    IsTopAlgIndependent K ({x} : Set L) ↔ x ∉ closure {y : L | IsAlgebraic K y} := by sorry

end DenseIntermediateFields

section PadicComplex
variable (p : ℕ) [Fact p.Prime]

-- topologicalTrdeg_padicComplex: the algebraic closure of `ℚ_[p]` is dense in `ℂ_[p]`,
-- although `Algebra.trdeg ℚ_[p] ℂ_[p]` is infinite.
example : topologicalTrdeg ℚ_[p] ℂ_[p] = 0 := by sorry

-- topologicalIndependenceDegree_padicComplex
example : topologicalIndependenceDegree ℚ_[p] ℂ_[p] = 0 := by sorry
end PadicComplex

section CompleteFields
variable (K L M : Type u)
variable [NontriviallyNormedField K] [NontriviallyNormedField L]
variable [NontriviallyNormedField M]
variable [CompleteSpace K] [CompleteSpace L] [CompleteSpace M]
variable [IsUltrametricDist K] [IsUltrametricDist L] [IsUltrametricDist M]
variable [IsAlgClosed K] [IsAlgClosed L] [IsAlgClosed M]

/-- `DiamondEtaleCohomology:C8/finite-topological-generators`.
The tuple may contain repetitions, permitting padding from fewer than n generators. -/
theorem finite_topological_generators [Algebra K L]
    (hKL : Isometry (algebraMap K L)) (n : ℕ) :
    topologicalTrdeg K L ≤ n ↔
      ∃ t : Fin n → L, ∀ A : IntermediateField K L,
        IsClosed (A : Set L) → IsAlgClosed A →
        (∀ i, t i ∈ A) → A = ⊤ := by sorry

/-- `DiamondEtaleCohomology:C8/topological-trdeg-tower`. -/
theorem topological_trdeg_tower [Algebra K L] [Algebra L M] [Algebra K M]
    [IsScalarTower K L M]
    (hKL : Isometry (algebraMap K L)) (hLM : Isometry (algebraMap L M)) :
    topologicalTrdeg K M ≤ topologicalTrdeg L M + topologicalTrdeg K L := by sorry

/-- `DiamondEtaleCohomology:C8/independent-le-generating-degree` (a), Temkin 3.2.1. -/
theorem topologicalIndependenceDegree_le_topologicalTrdeg [Algebra K M]
    (hKM : Isometry (algebraMap K M)) :
    topologicalIndependenceDegree K M ≤ topologicalTrdeg K M := by sorry

/-- `DiamondEtaleCohomology:C8/independent-le-generating-degree` (b), Temkin 3.2.3 and
Remark 2.1.10(i): equality when the generating degree is finite. -/
theorem topologicalIndependenceDegree_eq_of_lt_top [Algebra K M]
    (hKM : Isometry (algebraMap K M)) (hfin : topologicalTrdeg K M < ⊤) :
    topologicalIndependenceDegree K M = topologicalTrdeg K M := by sorry

/-- `DiamondEtaleCohomology:C8/independent-le-generating-degree` (c), Temkin Lemma 2.2.2. -/
theorem topologicalIndependenceDegree_mono [Algebra K L] [Algebra L M] [Algebra K M]
    [IsScalarTower K L M]
    (hKL : Isometry (algebraMap K L)) (hLM : Isometry (algebraMap L M)) :
    topologicalIndependenceDegree K L ≤ topologicalIndependenceDegree K M := by sorry

-- topologicalTrdeg_eq_zero_iff_surjective
example [Algebra K L] (hKL : Isometry (algebraMap K L)) :
    topologicalTrdeg K L = 0 ↔ Function.Surjective (algebraMap K L) := by sorry

/-- `DiamondEtaleCohomology:C8/topological-trdeg-finite-monotonicity`.
ECD's paragraph after Question 21.4, using Temkin 3.2.3 and 2.2.2.
The finiteness assumption is on the intermediate extension, not only the ambient one. -/
theorem topologicalTrdeg_mono_of_lt_top [Algebra K L] [Algebra L M] [Algebra K M]
    [IsScalarTower K L M]
    (hKL : Isometry (algebraMap K L)) (hLM : Isometry (algebraMap L M))
    (hfinite : topologicalTrdeg K L < ⊤) :
    topologicalTrdeg K L ≤ topologicalTrdeg K M := by sorry

/-- `DiamondEtaleCohomology:C8/topological-trdeg-base-change`.
The density hypothesis concerns the relative algebraic closure of the compositum in L'.
It is neither an arbitrary square nor a requirement that the bare compositum be dense. -/
theorem topological_trdeg_base_change
    (K' L' : Type u) [NontriviallyNormedField K'] [NontriviallyNormedField L']
    [CompleteSpace K'] [CompleteSpace L'] [IsUltrametricDist K'] [IsUltrametricDist L']
    [IsAlgClosed K'] [IsAlgClosed L']
    [Algebra K K'] [Algebra K L] [Algebra K L'] [Algebra K' L'] [Algebra L L']
    [IsScalarTower K K' L'] [IsScalarTower K L L']
    (hKK' : Isometry (algebraMap K K')) (hKL : Isometry (algebraMap K L))
    (hK'L' : Isometry (algebraMap K' L')) (hLL' : Isometry (algebraMap L L'))
    (hd : Dense {x : L' |
      IsAlgebraic (IntermediateField.adjoin L (Set.range (algebraMap K' L'))) x}) :
    topologicalTrdeg L L' ≤ topologicalTrdeg K K' := by sorry
end CompleteFields

/-- Isometric complete algebraically closed extension data at a fixed universe (C8.10). -/
structure CompleteACExtension (K L : Type u)
    [NontriviallyNormedField K] [NontriviallyNormedField L] [Algebra K L] where
  Field : Type u
  normedField : NontriviallyNormedField Field
  complete : @CompleteSpace Field normedField.toUniformSpace
  ultrametric : @IsUltrametricDist Field normedField.toDist
  algebraicallyClosed : @IsAlgClosed Field normedField.toField
  algebraK : Algebra K Field
  algebraL : Algebra L Field
  tower : @IsScalarTower K L Field _ _ algebraK.toSMul
  isometry : Isometry (@algebraMap L Field _ _ algebraL)

attribute [instance] CompleteACExtension.normedField CompleteACExtension.complete
  CompleteACExtension.ultrametric CompleteACExtension.algebraicallyClosed
  CompleteACExtension.algebraK CompleteACExtension.algebraL CompleteACExtension.tower

/-- Complete real-valued amalgamation provides compatible isometric embeddings
of two complete extensions over their nontrivially valued base (C8.11a). -/
theorem completeFieldAmalgamation
    (K L M : Type u) [NontriviallyNormedField K] [NontriviallyNormedField L]
    [NontriviallyNormedField M] [CompleteSpace K] [CompleteSpace L] [CompleteSpace M]
    [IsUltrametricDist K] [IsUltrametricDist L] [IsUltrametricDist M]
    [Algebra K L] [Algebra K M]
    (hKL : Isometry (algebraMap K L)) (hKM : Isometry (algebraMap K M)) :
    ∃ E : CompleteACExtension K L, ∃ f : M →ₐ[K] E.Field, Isometry f := by sorry

/-- A commuting isometric tower gives an actual further-extension witness (C8.10). -/
example (K L M : Type u) [NontriviallyNormedField K] [NontriviallyNormedField L]
    [NontriviallyNormedField M] [CompleteSpace M] [IsUltrametricDist M] [IsAlgClosed M]
    [Algebra K L] [Algebra L M] [Algebra K M] [IsScalarTower K L M]
    (hKL : Isometry (algebraMap K L)) (hLM : Isometry (algebraMap L M)) :
    ∃ E : CompleteACExtension K L, Nonempty (E.Field ≃ₐ[L] M) := by sorry

/-- Actual extension data force the K-algebra triangle to commute (C8.10). -/
example (K L : Type u) [NontriviallyNormedField K] [NontriviallyNormedField L]
    [Algebra K L] (E : CompleteACExtension K L) :
    ∀ x : K, algebraMap K E.Field x =
      algebraMap L E.Field (algebraMap K L x) := by sorry

/-- A continuous embedding that changes a norm fails the isometric-witness condition (C8.10). -/
example (L M : Type u) [NontriviallyNormedField L] [NontriviallyNormedField M]
    (f : L →+* M) (hf : Continuous f) (x : L) (hx : ‖f x‖ ≠ ‖x‖) :
    ¬ Isometry f := by sorry

section ModifiedFields
variable (K L : Type u) [NontriviallyNormedField K] [NontriviallyNormedField L]
variable [CompleteSpace K] [CompleteSpace L] [IsUltrametricDist K] [IsUltrametricDist L]
variable [IsAlgClosed K] [IsAlgClosed L] [Algebra K L]

/-- `DiamondEtaleCohomology:C8/modified-topological-trdeg`. -/
def modifiedTopologicalTrdeg (K L : Type u)
    [NontriviallyNormedField K] [NontriviallyNormedField L] [Algebra K L] : ℕ∞ :=
  ⨅ (n : ℕ) (_ : ∃ E : CompleteACExtension K L, topologicalTrdeg K E.Field ≤ n), (n : ℕ∞)

/-- The identity further extension is an actual witness (C8.10). -/
example (hKL : Isometry (algebraMap K L)) :
    ∃ E : CompleteACExtension K L, Nonempty (E.Field ≃ₐ[L] L) := by sorry

/-- `DiamondEtaleCohomology:C8/modified-trdeg-finite-equality`.
The finite-degree case does not assert an answer to Question 21.4. -/
theorem modifiedTopologicalTrdeg_eq_of_lt_top (hKL : Isometry (algebraMap K L))
    (hfinite : topologicalTrdeg K L < ⊤) :
    modifiedTopologicalTrdeg K L = topologicalTrdeg K L := by sorry

/-- `DiamondEtaleCohomology:C8/modified-trdeg-tower`. -/
theorem modified_topological_trdeg_tower
    (M : Type u) [NontriviallyNormedField M] [CompleteSpace M]
    [IsUltrametricDist M] [IsAlgClosed M] [Algebra L M] [Algebra K M]
    [IsScalarTower K L M]
    (hKL : Isometry (algebraMap K L)) (hLM : Isometry (algebraMap L M)) :
    modifiedTopologicalTrdeg K M ≤
      modifiedTopologicalTrdeg L M + modifiedTopologicalTrdeg K L := by sorry

/-- `DiamondEtaleCohomology:C8/modified-trdeg-base-change`. -/
theorem modified_topological_trdeg_base_change
    (K' L' : Type u) [NontriviallyNormedField K'] [NontriviallyNormedField L']
    [CompleteSpace K'] [CompleteSpace L'] [IsUltrametricDist K'] [IsUltrametricDist L']
    [IsAlgClosed K'] [IsAlgClosed L']
    [Algebra K K'] [Algebra K L'] [Algebra K' L'] [Algebra L L']
    [IsScalarTower K K' L'] [IsScalarTower K L L']
    (hKK' : Isometry (algebraMap K K')) (hKL : Isometry (algebraMap K L))
    (hK'L' : Isometry (algebraMap K' L')) (hLL' : Isometry (algebraMap L L'))
    (hd : Dense {x : L' |
      IsAlgebraic (IntermediateField.adjoin L (Set.range (algebraMap K' L'))) x}) :
    modifiedTopologicalTrdeg L L' ≤ modifiedTopologicalTrdeg K K' := by sorry

-- modifiedTopologicalTrdeg_identity
example : modifiedTopologicalTrdeg K K = 0 := by sorry

-- modifiedTopologicalTrdeg_zeroWitness
example (E : CompleteACExtension K L) (hE : topologicalTrdeg K E.Field = 0) :
    modifiedTopologicalTrdeg K L = 0 := by sorry

-- modifiedTopologicalTrdeg_eq_one
example (hKL : Isometry (algebraMap K L)) (h : topologicalTrdeg K L = 1) :
    modifiedTopologicalTrdeg K L = 1 := by sorry

-- modifiedTopologicalTrdeg_noFiniteWitness
example (h : ∀ E : CompleteACExtension K L, topologicalTrdeg K E.Field = ⊤) :
    modifiedTopologicalTrdeg K L = ⊤ := by sorry

-- modifiedTopologicalTrdeg_vsOriginal
example (hKL : Isometry (algebraMap K L))
    (h : ∀ E : CompleteACExtension K L, topologicalTrdeg K L ≤ topologicalTrdeg K E.Field) :
    modifiedTopologicalTrdeg K L = topologicalTrdeg K L := by sorry

-- modifiedTopologicalTrdeg_eq_zero_iff_surjective
example (hKL : Isometry (algebraMap K L)) :
    modifiedTopologicalTrdeg K L = 0 ↔ Function.Surjective (algebraMap K L) := by sorry

end ModifiedFields

section WildAutomorphisms
open Filter
open scoped Topology
variable {p : ℕ} {C : Type u}
variable [NontriviallyNormedField C] [CompleteSpace C]
variable [IsUltrametricDist C] [IsAlgClosed C] [CharP C p]

/-- `DiamondEtaleCohomology:C8/wild-automorphism`, ECD Lemma 21.17.
The inequality is the literal trivial-action condition on leading multiplicative terms.
Factorial-power convergence is an assumption, not inferred merely from continuity. -/
theorem wild_automorphism (hp : p.Prime) (γ : C ≃+* C) (hγ : Continuous γ)
    (hfactorial : ∀ x : C,
      Tendsto (fun n : ℕ => (γ ^ Nat.factorial n) x) atTop (𝓝 x))
    (hleading : ∀ x : C, x ≠ 0 → ‖γ x / x - 1‖ < 1) :
    ∀ x : C, Tendsto (fun n : ℕ => (γ ^ (p ^ n)) x) atTop (𝓝 x) := by sorry

/-- `DiamondEtaleCohomology:C8/wild-kernel-pro-p`, the first step of ECD 21.16.
P is identified by its actual membership condition, not an opaque wildness proposition.
Faithfulness excludes an invisible non-pro-p kernel in the action. -/
theorem wild_kernel_pro_p (hp : p.Prime)
    {G : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
    (ρ : G →* (C ≃+* C)) (hfaithful : Function.Injective ρ)
    (hact : Continuous (fun gx : G × C => ρ gx.1 gx.2))
    (P : Subgroup G) (hclosed : IsClosed (P : Set G))
    (hP : ∀ g : G, g ∈ P ↔ ∀ x : C, x ≠ 0 → ‖ρ g x / x - 1‖ < 1) :
    TauCeti.IsProP p P := by sorry

-- Negative control: identity automorphism satisfies both convergence conclusions.
example (x : C) :
    Tendsto (fun n : ℕ => ((RingEquiv.refl C) ^ Nat.factorial n) x) atTop (𝓝 x) ∧
      Tendsto (fun n : ℕ => ((RingEquiv.refl C) ^ (p ^ n)) x) atTop (𝓝 x) := by sorry

-- Negative control: the leading-term condition omits zero, where division is totalized.
example : ¬ ‖(RingEquiv.refl C) 0 / (0 : C) - 1‖ < 1 := by sorry

/-- The trivial action has trivial wild kernel, which is pro-p. -/
example (hp : p.Prime) (P : Subgroup PUnit)
    (hP : ∀ g : PUnit, g ∈ P ↔
      ∀ x : C, x ≠ 0 → ‖(1 : PUnit →* (C ≃+* C)) g x / x - 1‖ < 1) :
    P = ⊥ ∧ TauCeti.IsProP p P := by sorry

end WildAutomorphisms

section SpecializationChains
open CategoryTheory
open scoped Simplicial
variable (X : Type u) [TopologicalSpace X]

/-- The degree-n tuples satisfying specialization in the original topology (C8.42). -/
abbrev SpecializationChain (X : Type u) [TopologicalSpace X] (n : ℕ) : Type u :=
  {c : Fin (n + 1) → WithConstructibleTopology X //
    ∀ i j, i ≤ j →
      Specializes (WithTopology.ofTopology (c i) : X) (WithTopology.ofTopology (c j) : X)}

-- specializationChainSpace_empty
example [IsEmpty X] (n : ℕ) : IsEmpty (SpecializationChain X n) := by sorry

/-- A one-point space has exactly one chain in every degree (C8.42). -/
example [Unique X] (n : ℕ) : Nonempty (SpecializationChain X n) ∧
    Subsingleton (SpecializationChain X n) := by sorry

-- On a discrete space every specialization chain is constant.
example [DiscreteTopology X] (n : ℕ) (c : SpecializationChain X n)
    (i j : Fin (n + 1)) : c.val i = c.val j := by sorry

-- specializationChainSpace_twoPointChain: Prop with Mathlib's Sierpinski topology.
example :
    (∃! c : SpecializationChain Prop 1, Function.Injective c.val) ∧
      ¬ ∃ c : SpecializationChain Prop 2, Function.Injective c.val := by sorry

/-- The first vertex changes when face zero deletes it (C8.42). -/
example : ∃ c : SpecializationChain Prop 1, c.val 0 ≠ c.val 1 := by sorry

end SpecializationChains

section Specialization
attribute [local instance] specializationOrder

-- DiamondEtaleCohomology:C8/specialization-dimension
theorem specialization_dimension (X : Type u) [TopologicalSpace X]
    [QuasiSober X] [T0Space X] :
    topologicalKrullDim X = Order.krullDim X := by sorry
end Specialization

section SpectralCohomology
attribute [local instance] HasExt.standard

/-- DiamondEtaleCohomology:C8/spectral-cohomological-bound (Scheiderer's bound).
The quasi-augmented comparison and normalized-support result of C8.43 give this bound.
`Sheaf.H` is the pinned cohomology API. -/
theorem spectralCohomologicalBound (X : TopCat.{u}) [SpectralSpace X] (d : ℕ)
    (hd : topologicalKrullDim X ≤ (d : WithBot ℕ∞))
    (F : TopCat.Sheaf AddCommGrpCat.{u} X) (i : ℕ) (hi : d < i) :
    Subsingleton (Sheaf.H.{u+1} F i) := by sorry

end SpectralCohomology

/-
The README also specifies the valuation-ring comparison in C5.7 and
IsConstFGOn.iff_exists in C7.1.
The README specifies additional APIs: C7.11 includes HasFiltrationBy.of_mem; C7.1 includes
IsConstructibleSheaf.extendByZero_open, IsConstructibleSheaf.iff_compact,
IsConstructibleSheaf.stalk_fg. C8.2 uses the supplied AdicSpace.relDim;
relDim_identity is its nonempty identity specialization. C8.3 includes topologicalTrdeg_le_iff,
topologicalTrdeg_le_of_dense, topologicalTrdeg_eq_top_iff, topologicalTrdeg_self,
topologicalTrdeg_equiv.
C8.4 includes topologicalIndependenceDegree_le_iff and topologicalIndependenceDegree_self.
C8.10 includes modifiedTopologicalTrdeg_le_iff, modifiedTopologicalTrdeg_le,
modifiedTopologicalTrdeg_mono and modifiedTopologicalTrdeg_equiv. Their mathematical
contracts and the chain-space construction, quasi-augmentation and nondegeneracy theorem are in those sections.
C8.48a specifies analyticFieldPairPartiallyProper and its unrestricted reduction
analyticFieldPairPartiallyProper_iff_perfectoidTests; the comparison
analyticFieldPairPartiallyProper_diamondification carries relative tautness.
-/

end TauCeti.DiamondEtale
