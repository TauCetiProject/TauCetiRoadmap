import Mathlib
import TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Basic

/-!
# Étale cohomology of diamonds: headline theorem signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These statements suggest Lean forms for selected headline results; discharging
them finishes neither a layer nor the roadmap.

The statements here are relative Zariski–Riemann acyclicity (C5.7), the characterization
and filtered-colimit generation of constructible sheaves on spectral spaces (C7.5),
Temkin's finite-degree comparison (C8.5), the pro-p wild-kernel theorem (C8.34),
Scheiderer's spectral cohomological bound (C8.44), and compact generation with the
thick-envelope characterization on spectral spaces under a uniform bound (C9.8).
The definitions use the pinned module-sheaf, derived-category and field carriers.

The geometric headline results remain README targets because the pins have no perfectoid-space,
diamond or small v-stack carriers and no enhanced étale derived category. In particular,
C0's site comparisons and repleteness, C1's base change, C2's enhanced descent and
coreflection, C3's four operations, C4's canonical compactification, C5's proper base
change, C6's algebraically closed field invariance, C7's diamond constructibility and
perfect-constructible descent, C8's geometric and point-stabilizer dimension bounds,
and C9's compact-generation and perfect-constructible characterization for spatial
diamonds require those objects. The analytic dimension formulas in C8.49–C8.51 also
require analytic adic spaces and their completed residue-field interfaces. None of
these objects is represented by a free predicate here.
-/

noncomputable section

open CategoryTheory Limits Topology TopologicalSpace

universe u v

namespace TauCetiRoadmap.DiamondEtaleCohomology

/-! ## Layer C5: Étale extension by zero and proper base change -/

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
    ∀ n : ℕ, Subsingleton (Sheaf.H.{u+1} F n) := by
  sorry

end ValuationCohomology

/-! ## Layer C7: Constructibility and perfect complexes -/

section ConstructibleSheaves
variable (Λ : Type u) [Ring Λ]

/-- Finite stratification by constructible locally closed subsets with constant
finitely generated module values (C7.1). -/
def IsConstructibleSheaf [IsNoetherianRing Λ] {X : TopCat.{u}} [SpectralSpace X]
    (F : TopCat.Sheaf (ModuleCat.{u} Λ) X) : Prop :=
  ∃ (n : ℕ) (Z : Fin n → Set X),
    (∀ i, Topology.IsConstructible (Z i) ∧ IsLocallyClosed (Z i)) ∧
    Pairwise (fun i j => Disjoint (Z i) (Z j)) ∧ (⋃ i, Z i) = Set.univ ∧
    ∀ i, ∃ M : ModuleCat.{u} Λ, Module.Finite Λ M ∧
      Nonempty ((TopCat.Sheaf.pullback (ModuleCat.{u} Λ)
        (TopCat.ofHom ⟨Subtype.val, continuous_subtype_val⟩)).obj F ≅
          (constantSheaf (Opens.grothendieckTopology (Z i)) (ModuleCat.{u} Λ)).obj M)

/-- Constructible sheaves are exactly the finitely presentable sheaves, and every
module sheaf is a filtered colimit of constructible sheaves (C7.5, ECD Lemma 20.4). -/
theorem constructibleCompactSpectral [IsNoetherianRing Λ] (X : TopCat.{u}) [SpectralSpace X] :
    (∀ F : TopCat.Sheaf (ModuleCat.{u} Λ) X,
      IsConstructibleSheaf Λ F ↔ IsFinitelyPresentable.{u} F) ∧
    ∀ F : TopCat.Sheaf (ModuleCat.{u} Λ) X,
      ∃ (J : Type u) (_ : SmallCategory J) (_ : IsFiltered J)
        (D : J ⥤ TopCat.Sheaf (ModuleCat.{u} Λ) X) (c : Cocone D) (_ : IsColimit c),
        Nonempty (c.pt ≅ F) ∧ ∀ j, IsConstructibleSheaf Λ (D.obj j) := by
  sorry

end ConstructibleSheaves

/-! ## Layer C8: Dimension and cohomological bounds -/

section FieldDegrees
variable (K L : Type u) [Field K] [Field L] [Algebra K L] [TopologicalSpace L]

/-- Infimum of finite algebraic transcendence bounds witnessed by a dense intermediate field. -/
def topologicalTrdeg (K L : Type u) [Field K] [Field L] [Algebra K L]
    [TopologicalSpace L] : ℕ∞ :=
  ⨅ (n : ℕ) (_ : ∃ A : IntermediateField K L,
      Dense (A : Set L) ∧ Algebra.trdeg K A ≤ (n : Cardinal)), (n : ℕ∞)

variable {L} in
/-- No element lies in the closure of the elements algebraic over the field
generated by the other elements (C8.4, Temkin §2.1.6). -/
def IsTopAlgIndependent (s : Set L) : Prop :=
  ∀ x ∈ s, x ∉ closure {y : L | IsAlgebraic (IntermediateField.adjoin K (s \ {x})) y}

/-- Temkin's independent degree `top.tr.deg`, through finite independent sets. -/
def topologicalIndependenceDegree : ℕ∞ :=
  ⨆ (s : Finset L) (_ : IsTopAlgIndependent K (s : Set L)), (s.card : ℕ∞)

end FieldDegrees

/-- Temkin's finite-degree comparison (C8.5): topological independence and dense
algebraic generation have the same degree for finite generating degree. -/
theorem topologicalIndependenceDegree_eq_of_lt_top
    (K L : Type u) [NontriviallyNormedField K] [NontriviallyNormedField L]
    [CompleteSpace K] [CompleteSpace L] [IsUltrametricDist K] [IsUltrametricDist L]
    [IsAlgClosed K] [IsAlgClosed L] [Algebra K L]
    (hKL : Isometry (algebraMap K L)) (hfin : topologicalTrdeg K L < ⊤) :
    topologicalIndependenceDegree K L = topologicalTrdeg K L := by
  sorry

section WildKernel
variable {p : ℕ} {C : Type u}
variable [NontriviallyNormedField C] [CompleteSpace C]
variable [IsUltrametricDist C] [IsAlgClosed C] [CharP C p]

/-- The kernel of a continuous faithful profinite action on leading multiplicative
terms is pro-p (C8.34, ECD Proposition 21.16). -/
theorem wild_kernel_pro_p (hp : p.Prime)
    {G : Type v} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [T2Space G] [TotallyDisconnectedSpace G]
    (ρ : G →* (C ≃+* C)) (hfaithful : Function.Injective ρ)
    (hact : Continuous (fun gx : G × C => ρ gx.1 gx.2))
    (P : Subgroup G) (hclosed : IsClosed (P : Set G))
    (hP : ∀ g : G, g ∈ P ↔ ∀ x : C, x ≠ 0 → ‖ρ g x / x - 1‖ < 1) :
    TauCeti.IsProP p P := by
  sorry

end WildKernel

section SpectralCohomology
attribute [local instance] HasExt.standard

/-- Sheaf cohomology on a spectral space vanishes above its topological Krull
dimension (C8.44, Scheiderer's bound). -/
theorem spectralCohomologicalBound (X : TopCat.{u}) [SpectralSpace X] (d : ℕ)
    (hd : topologicalKrullDim X ≤ (d : WithBot ℕ∞))
    (F : TopCat.Sheaf AddCommGrpCat.{u} X) (i : ℕ) (hi : d < i) :
    Subsingleton (Sheaf.H.{u+1} F i) := by
  sorry

end SpectralCohomology

/-! ## Layer C9: Compact generation under a uniform bound -/

/-- Open extension by zero transports the canonical slice-site left adjoint to
sheaves on the open subspace, using the pinned generic construction. -/
def extendByZero (Λ : Type u) [Ring Λ] {X : TopCat.{u}} (U : Opens X) :
    TopCat.Sheaf (ModuleCat.{u} Λ) (TopCat.of U) ⥤ TopCat.Sheaf (ModuleCat.{u} Λ) X :=
  U.sheafEquivOver.inverse ⋙
    (Over.forget U).sheafPullback (ModuleCat.{u} Λ)
      ((Opens.grothendieckTopology X).over U) (Opens.grothendieckTopology X)

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
          (fun B => ∃ U : Opens X, IsCompact (U : Set X) ∧ Nonempty (B ≅ G U)) A := by
  sorry

end SpectralCompactGeneration

end TauCetiRoadmap.DiamondEtaleCohomology
