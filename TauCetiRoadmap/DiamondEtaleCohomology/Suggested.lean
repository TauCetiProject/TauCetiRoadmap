import Mathlib
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic

/-!
# DiamondEtaleCohomology: representative target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These suggested forms record light definitions and milestone theorem signatures
statable against the pinned Mathlib and Tau Ceti APIs. Discharging them finishes neither a
layer nor the roadmap.

The statements use spectral spaces, module sheaves and complete nonarchimedean fields on the
library's carriers. The coefficient sites, enhanced étale categories, geometric operations,
compactifications and diamond dimension bounds are specified in the README. The compact-generation
and compact-object signatures at the top give the topological coefficient form of C9 on every
spectral space with a common cohomological bound and its geometric-point form on the module-derived category.
The full spatial-diamond statements use the
geometric carriers specified in C0–C2. Field tower
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

/-- Open extension by zero transports the canonical slice-site left adjoint to
sheaves on the open subspace, using the pinned generic construction. -/
def extendByZero (Λ : Type u) [Ring Λ] {X : TopCat.{u}} (U : Opens X) :
    TopCat.Sheaf (ModuleCat.{u} Λ) (TopCat.of U) ⥤ TopCat.Sheaf (ModuleCat.{u} Λ) X :=
  U.sheafEquivOver.inverse ⋙
    (Over.forget U).sheafPullback (ModuleCat.{u} Λ)
      ((Opens.grothendieckTopology X).over U) (Opens.grothendieckTopology X)

/-! ## Compact generation and compact objects -/

section SpectralCompactGeneration
variable (Λ : Type u) [CommRing Λ] (X : TopCat.{u}) [SpectralSpace X]
    [HasDerivedCategory.{v} (TopCat.Sheaf (ModuleCat.{u} Λ) X)]

/-- On a spectral space with one cohomological bound on its quasicompact open basis,
extensions of the coefficient ring compactly generate the unbounded derived category;
its compact objects are their thick closure (C9.8 and C9.12). -/
theorem compactGeneration_spectral (N : ℕ) :
    let G : Opens X → DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) X) := fun U =>
      (DerivedCategory.singleFunctor (TopCat.Sheaf (ModuleCat.{u} Λ) X) 0).obj
        ((extendByZero Λ U).obj
          ((constantSheaf (Opens.grothendieckTopology U) (ModuleCat.{u} Λ)).obj
            (ModuleCat.of Λ Λ)))
    (∀ U : Opens X, IsCompact (U : Set X) →
      ∀ F : TopCat.Sheaf (ModuleCat.{u} Λ) X, ∀ i : ℕ, N < i →
        Subsingleton (G U ⟶
          ((DerivedCategory.singleFunctor (TopCat.Sheaf (ModuleCat.{u} Λ) X) 0).obj F)⟦(i : ℤ)⟧)) →
    HasCoproducts.{u} (DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) X)) ∧
      (∀ U : Opens X, IsCompact (U : Set X) → ∀ J : Type u,
        PreservesColimitsOfShape (Discrete J) (preadditiveCoyoneda.obj (Opposite.op (G U)))) ∧
      (∀ A : DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) X),
        (∀ U : Opens X, IsCompact (U : Set X) → ∀ n : ℤ,
          Subsingleton (G U ⟶ A⟦n⟧)) → IsZero A) ∧
      ∀ A : DerivedCategory (TopCat.Sheaf (ModuleCat.{u} Λ) X),
        (∀ J : Type u, PreservesColimitsOfShape (Discrete J)
          (preadditiveCoyoneda.obj (Opposite.op A))) ↔
        ObjectProperty.triangEnvelope
          (fun B => ∃ U : Opens X, IsCompact (U : Set X) ∧ Nonempty (B ≅ G U)) A := by sorry

end SpectralCompactGeneration

section PointCompactGeneration
variable (Λ : Type u) [CommRing Λ] [HasDerivedCategory.{v} (ModuleCat.{u} Λ)]

/-- At a geometric point, the coefficient ring compactly generates its unbounded derived
category: coproducts exist, Hom from the unit preserves them, and its shifts detect zero (C9.8). -/
theorem compactGeneration_point :
    let R := (DerivedCategory.singleFunctor (ModuleCat.{u} Λ) 0).obj (ModuleCat.of Λ Λ)
    HasCoproducts.{u} (DerivedCategory (ModuleCat.{u} Λ)) ∧
      (∀ J : Type u, PreservesColimitsOfShape (Discrete J)
        (preadditiveCoyoneda.obj (Opposite.op R))) ∧
      ∀ A : DerivedCategory (ModuleCat.{u} Λ),
        (∀ n : ℤ, Subsingleton (R ⟶ A⟦n⟧)) → IsZero A := by sorry

/-- At a geometric point, compact coefficient complexes are exactly the thick closure
of the unit, equivalently the perfect complexes, for every commutative ring (C9.12). -/
theorem compact_iff_perfect_point (A : DerivedCategory (ModuleCat.{u} Λ)) :
    let R := (DerivedCategory.singleFunctor (ModuleCat.{u} Λ) 0).obj (ModuleCat.of Λ Λ)
    (∀ J : Type u, PreservesColimitsOfShape (Discrete J)
      (preadditiveCoyoneda.obj (Opposite.op A))) ↔
      ObjectProperty.triangEnvelope
        ((fun B => Nonempty (B ≅ R)) : ObjectProperty (DerivedCategory (ModuleCat.{u} Λ))) A := by sorry

end PointCompactGeneration

/-! ## Layers C2–C3: cutoff mates and intrinsic pushforward -/

section CutoffPushforward
variable {C D C' D' : Type u}
    [Category.{v} C] [Category.{v} D] [Category.{v} C'] [Category.{v} D']
    {L : C ⥤ D} {R : D ⥤ C} {L' : C' ⥤ D'} {R' : D' ⥤ C'}
    (adj : L ⊣ R) (adj' : L' ⊣ R') (cC : C ⥤ C') (cD : D ⥤ D')
    (comm : L ⋙ cD ≅ cC ⋙ L')

/-- For fully faithful cutoff extensions, the ambient comparison is invertible
exactly when the larger right-adjoint value lies in the smaller essential image (C2.9). -/
theorem mate_isIso_iff_essImage [cC.Full] [cC.Faithful] [cD.Full] [cD.Faithful]
    (A : D) :
    IsIso ((mateEquiv adj adj' (TwoSquare.mk _ _ _ _ comm.inv)).natTrans.app A) ↔
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

/-- The slice equivalence and canonical sheaf adjunction provide the open adapter's
adjunction with restriction to the open subspace. -/
def extendByZeroAdjunction {X : TopCat.{u}} (U : Opens X) :
    extendByZero Λ U ⊣ U.sheafRestrict (C := ModuleCat.{u} Λ) :=
  (U.sheafEquivOver.symm.toAdjunction.comp
    ((Over.forget U).sheafAdjunctionContinuous (ModuleCat.{u} Λ) _ _)).ofNatIsoRight
      U.overPullbackSheafEquivOver

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

end OpenExtension

/-- On Sierpiński space, extension of a nonzero constant value from the generic
singleton has zero closed stalk and global sections; direct image has that value
at the closed point and therefore differs from extension by zero. -/
theorem extendByZero_sierpinski (Λ : Type) [Ring Λ] (M : ModuleCat.{0} Λ) [Nontrivial M] :
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

/-- Constant finite-generation on a subspace is invariant under sheaf isomorphism (C7.1). -/
theorem IsConstFGOn.iso {X : TopCat.{u}} {F G : TopCat.Sheaf (ModuleCat.{u} Λ) X}
    (e : F ≅ G) (Z : Set X) : IsConstFGOn Λ F Z ↔ IsConstFGOn Λ G Z := by sorry

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

/-- The stalk description of extension by zero on the punctured Cantor set
excludes constructibility (isConstructibleSheaf_not_qc_open, C7.1). -/
theorem isConstructibleSheaf_not_qc_open [IsNoetherianRing Λ] [Nontrivial Λ]
    (X : TopCat.{u}) [SpectralSpace X] (e : X ≃ₜ (ℕ → Bool)) (x : X)
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) X)
    (hx : IsZero (F.presheaf.stalk x))
    (hU : ∀ y : X, y ≠ x →
      Nonempty (F.presheaf.stalk y ≅ ModuleCat.of Λ Λ)) :
    ¬ IsConstructibleSheaf Λ F := by sorry

/-- Extension by zero from a quasicompact open spectral subspace preserves constructibility (C7.1). -/
theorem IsConstructibleSheaf.extendByZero_open [IsNoetherianRing Λ] {X : TopCat.{u}}
    [SpectralSpace X] (U : Opens X) (hU : IsCompact (U : Set X)) :
    letI : CompactSpace U := isCompact_iff_compactSpace.mp hU
    letI : SpectralSpace U := U.isOpenEmbedding'.spectralSpace
    ∀ (F : TopCat.Sheaf (ModuleCat.{u} Λ) (TopCat.of U)), IsConstructibleSheaf Λ F →
      IsConstructibleSheaf Λ ((extendByZero Λ U).obj F) := by sorry

/-- Constructible sheaves have finitely generated stalks at every point (C7.1). -/
theorem IsConstructibleSheaf.stalk_fg [IsNoetherianRing Λ] {X : TopCat.{u}}
    [SpectralSpace X] (F : TopCat.Sheaf (ModuleCat.{u} Λ) X)
    (hF : IsConstructibleSheaf Λ F) (x : X) : Module.Finite Λ (F.presheaf.stalk x) := by sorry

end ConstructibleSheaves

/-- `F` has a finite filtration `0 = F₀ ⊂ F₁ ⊂ ⋯ ⊂ Fₙ ≅ F` whose graded pieces satisfy `P`. -/
def HasFiltrationBy {C : Type*} [Category* C] [Abelian C] (P : C → Prop) (F : C) : Prop :=
  ∃ (n : ℕ) (G : Fin (n + 1) → C) (m : ∀ i : Fin n, G i.castSucc ⟶ G i.succ),
    (∀ i, Mono (m i)) ∧ IsZero (G 0) ∧ Nonempty (G (Fin.last n) ≅ F) ∧ ∀ i, P (cokernel (m i))

/-- The length-one filtration has its single graded piece isomorphic to F (ECD Proposition 20.8). -/
theorem HasFiltrationBy.of_mem {C : Type u} [Category C] [Abelian C] (P : C → Prop) (F : C)
    (hF : P F) (hP : ObjectProperty.IsClosedUnderIsomorphisms (C := C) P) :
    HasFiltrationBy P F := by sorry

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

end RelativeDimension

section DenseIntermediateFields
variable (K : Type u) (L : Type u) [Field K] [Field L] [Algebra K L]
variable [TopologicalSpace L]

/-- Infimum of finite algebraic transcendence bounds witnessed by a dense intermediate field. -/
def topologicalTrdeg (K L : Type u) [Field K] [Field L] [Algebra K L]
    [TopologicalSpace L] : ℕ∞ :=
  ⨅ (n : ℕ) (_ : ∃ A : IntermediateField K L,
      Dense (A : Set L) ∧ Algebra.trdeg K A ≤ (n : Cardinal)), (n : ℕ∞)

/-- A finite generating-degree bound is witnessed by a dense intermediate field (C8.3). -/
theorem topologicalTrdeg_le_iff (n : ℕ) :
    topologicalTrdeg K L ≤ n ↔ ∃ A : IntermediateField K L,
      Dense (A : Set L) ∧ Algebra.trdeg K A ≤ (n : Cardinal) := by sorry

variable {L} in
/-- `DiamondEtaleCohomology:C8/topological-independence-degree`, Temkin §2.1.6.
No element of `s` lies in the closure of the elements algebraic over the intermediate field
generated by the other elements. In a complete algebraically closed `L` that closure is the
completed algebraic closure, so this is Temkin's topgebraic independence. -/
def IsTopAlgIndependent (s : Set L) : Prop :=
  ∀ x ∈ s, x ∉ closure {y : L | IsAlgebraic (IntermediateField.adjoin K (s \ {x})) y}

/-- Topological algebraic independence implies algebraic independence (C8.4). -/
theorem IsTopAlgIndependent.algebraicIndependent (s : Set L) (hs : IsTopAlgIndependent K s) :
    AlgebraicIndependent K ((↑) : s → L) := by sorry

/-- Restricting a topologically algebraically independent set preserves independence (C8.4). -/
theorem IsTopAlgIndependent.mono {s t : Set L} (hs : IsTopAlgIndependent K s) (ht : t ⊆ s) :
    IsTopAlgIndependent K t := by sorry

/-- Temkin's independent degree `top.tr.deg`, through finite independent sets. -/
def topologicalIndependenceDegree : ℕ∞ :=
  ⨆ (s : Finset L) (_ : IsTopAlgIndependent K (s : Set L)), (s.card : ℕ∞)

end DenseIntermediateFields

section PadicComplex
variable (p : ℕ) [Fact p.Prime]

/-- The dense algebraic closure of the p-adic field gives generating degree zero (C8.3). -/
theorem topologicalTrdeg_padicComplex : topologicalTrdeg ℚ_[p] ℂ_[p] = 0 := by sorry

/-- Density of algebraic p-adic elements rules out topological independence (C8.4). -/
theorem topologicalIndependenceDegree_padicComplex : topologicalIndependenceDegree ℚ_[p] ℂ_[p] = 0 := by sorry
end PadicComplex

section CompleteBaseField
variable (K L : Type u) [NontriviallyNormedField K] [NontriviallyNormedField L]
variable [CompleteSpace K] [IsUltrametricDist K] [IsAlgClosed K] [Algebra K L]

/-- Over a complete algebraically closed nonarchimedean base, generating degree zero
detects surjectivity of an isometric embedding into any normed field (C8.3). -/
theorem topologicalTrdeg_eq_zero_iff_surjective (hKL : Isometry (algebraMap K L)) :
    topologicalTrdeg K L = 0 ↔ Function.Surjective (algebraMap K L) := by sorry

end CompleteBaseField

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

section ModifiedFields
variable (K L : Type u) [NontriviallyNormedField K] [NontriviallyNormedField L]
variable [CompleteSpace K] [CompleteSpace L] [IsUltrametricDist K] [IsUltrametricDist L]
variable [IsAlgClosed K] [IsAlgClosed L] [Algebra K L]

/-- `DiamondEtaleCohomology:C8/modified-topological-trdeg`. -/
def modifiedTopologicalTrdeg (K L : Type u)
    [NontriviallyNormedField K] [NontriviallyNormedField L] [Algebra K L] : ℕ∞ :=
  ⨅ (n : ℕ) (_ : ∃ E : CompleteACExtension K L, topologicalTrdeg K E.Field ≤ n), (n : ℕ∞)

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

/-- A finite modified-degree bound is witnessed by an actual further valued extension (C8.10). -/
theorem modifiedTopologicalTrdeg_le_iff (n : ℕ) :
    modifiedTopologicalTrdeg K L ≤ n ↔
      ∃ E : CompleteACExtension K L, topologicalTrdeg K E.Field ≤ n := by sorry

/-- Further isometric extension can only increase the modified generating degree (C8.10). -/
theorem modifiedTopologicalTrdeg_mono
    (M : Type u) [NontriviallyNormedField M] [CompleteSpace M]
    [IsUltrametricDist M] [IsAlgClosed M] [Algebra L M] [Algebra K M]
    [IsScalarTower K L M]
    (hKL : Isometry (algebraMap K L)) (hLM : Isometry (algebraMap L M)) :
    modifiedTopologicalTrdeg K L ≤ modifiedTopologicalTrdeg K M := by sorry

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

/-- Monotone vertex reindexing preserves specialization chains (C8.42). -/
def SpecializationChain.reindex {X : Type u} [TopologicalSpace X] {m n : ℕ}
    (c : SpecializationChain X n) (θ : Fin (m + 1) →o Fin (n + 1)) :
    SpecializationChain X m :=
  ⟨c.val ∘ θ, fun i j hij => c.property (θ i) (θ j) (θ.monotone hij)⟩

/-- Successive reindexings of a specialization chain compose as monotone vertex maps (C8.42). -/
theorem SpecializationChain.reindex_comp {X : Type u} [TopologicalSpace X] {k m n : ℕ}
    (c : SpecializationChain X n) (θ : Fin (m + 1) →o Fin (n + 1))
    (φ : Fin (k + 1) →o Fin (m + 1)) :
    (c.reindex θ).reindex φ = c.reindex (θ.comp φ) := by sorry

end SpecializationChains

section Specialization
attribute [local instance] specializationOrder

/-- Topological Krull dimension agrees with the specialization-order dimension (C8.1). -/
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
The README specifies additional APIs: C7.1 includes
IsConstructibleSheaf.iff_compact. C8.2 uses the supplied AdicSpace.relDim;
relDim_id is its nonempty identity specialization. C8.3 includes topologicalTrdeg_le_of_dense, topologicalTrdeg_eq_top_iff, topologicalTrdeg_self,
topologicalTrdeg_equiv.
C8.4 includes topologicalIndependenceDegree_le_iff and topologicalIndependenceDegree_self.
C8.10 includes modifiedTopologicalTrdeg_le and modifiedTopologicalTrdeg_equiv. Their mathematical
contracts and the chain-space construction, quasi-augmentation and nondegeneracy theorem are in those sections.
C8.48a specifies analyticFieldPairPartiallyProper and its unrestricted reduction
analyticFieldPairPartiallyProper_iff_perfectoidTests; the comparison
analyticFieldPairPartiallyProper_diamondification carries relative tautness.
-/

end TauCeti.DiamondEtale
