import Mathlib

/-!
# Group schemes over a base: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The declarations below suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them finishes
neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap library -- these
are goals, not proofs -- and nothing here is a `Prop`-typed placeholder standing in for a
condition that cannot yet be stated.

Only Mathlib is imported. The carrier is Mathlib's `Grp (Over S)` for the cartesian monoidal
structure on `Over S` supplied by `AlgebraicGeometry.Pullbacks`; the structure morphism of `G` is
`G.X.hom`. The milestones that need Tau Ceti's field predicates (connected reductive geometric
fibres, maximal tori, Borel subgroups over a field), the rank invariants of GS4, and the Picard
groups of GS7--GS8 stay in the README until their carriers can be imported here.
-/

universe u

namespace TauCetiRoadmap.GroupSchemesOverABase

open CategoryTheory Limits AlgebraicGeometry

noncomputable section

/-! ## GS0: carriers over a base -/

section GS0

variable {S : Scheme.{u}}

/-- Base change of group schemes along `f : S' ⟶ S`. It is to be implemented as
`(Over.pullback f).mapGrp`, using the braided instance on `Over.pullback`. -/
def baseChange {S' : Scheme.{u}} (f : S' ⟶ S) : Grp (Over S) ⥤ Grp (Over S') := sorry

/-- The geometric fibre of `G` at a geometric point `x : Spec Ω ⟶ S` (Convention 3). -/
def geometricFiber (G : Grp (Over S)) {Ω : Type u} [Field Ω] [IsAlgClosed Ω]
    (x : Spec (CommRingCat.of Ω) ⟶ S) : Grp (Over (Spec (CommRingCat.of Ω))) :=
  (baseChange x).obj G

/-- GS0.4: the identity component of a smooth group scheme of finite presentation
(SGA 3, Exp. VI_B, 3.10). -/
def identityComponent (G : Grp (Over S)) [Smooth G.X.hom] : Grp (Over S) := sorry

/-- The identity component is an open subgroup scheme. -/
theorem isOpenImmersion_identityComponent (G : Grp (Over S)) [Smooth G.X.hom] :
    ∃ ι : identityComponent G ⟶ G, IsOpenImmersion ((Grp.forget (Over S)).map ι).left := sorry

/-- The identity component is smooth over the base. -/
theorem smooth_identityComponent (G : Grp (Over S)) [Smooth G.X.hom] :
    Smooth (identityComponent G).X.hom := sorry

end GS0

/-! ## GS1: diagonalizable groups -/

section GS1

/-- `D_S(M) = Spec_S O_S[M]`, the base change from `Spec ℤ` of Tau Ceti's
`DiagonalizableGroup.groupScheme`. -/
def diagonalizable (S : Scheme.{u}) (M : Type u) [AddCommGroup M] : Grp (Over S) := sorry

variable {S : Scheme.{u}}

/-- The multiplicative group `𝔾_{m,S} = D_S(ℤ)`. -/
abbrev multiplicativeGroup (S : Scheme.{u}) : Grp (Over S) :=
  diagonalizable S (ULift.{u} ℤ)

/-- The group of `n`-th roots of unity `μ_{n,S} = D_S(ℤ/n)`. -/
abbrev rootsOfUnity (S : Scheme.{u}) (n : ℕ) : Grp (Over S) :=
  diagonalizable S (ULift.{u} (ZMod n))

theorem isCommMonObj_diagonalizable (M : Type u) [AddCommGroup M] :
    IsCommMonObj (diagonalizable S M).X := sorry

theorem isAffineHom_diagonalizable (M : Type u) [AddCommGroup M] :
    IsAffineHom (diagonalizable S M).X.hom := sorry

theorem flat_diagonalizable (M : Type u) [AddCommGroup M] :
    Flat (diagonalizable S M).X.hom := sorry

theorem locallyOfFinitePresentation_diagonalizable (M : Type u) [AddCommGroup M]
    [Module.Finite ℤ M] : LocallyOfFinitePresentation (diagonalizable S M).X.hom := sorry

/-- GS1.2: over a connected base, homomorphisms `D_S(M) ⟶ D_S(N)` are homomorphisms
`N →+ M` (contravariance as in Convention 5). -/
def diagonalizableHomEquiv [ConnectedSpace S] (M N : Type u) [AddCommGroup M]
    [AddCommGroup N] [Module.Finite ℤ M] [Module.Finite ℤ N] :
    (diagonalizable S M ⟶ diagonalizable S N) ≃ (N →+ M) := sorry

/-- GS1.3: `μ_n` is smooth exactly where `n` is invertible. -/
theorem smooth_rootsOfUnity_iff (n : ℕ) [NeZero n] :
    Smooth (rootsOfUnity S n).X.hom ↔ ∀ s : S, (n : S.residueField s) ≠ 0 := sorry

end GS1

/-! ## GS2: groups of multiplicative type and tori -/

section GS2

variable {S : Scheme.{u}}

/-- `G` is isomorphic to `D_S(M)` for a finitely generated `M`. -/
def IsDiagonalizable (G : Grp (Over S)) : Prop :=
  ∃ (M : Type u) (_ : AddCommGroup M), Module.Finite ℤ M ∧ Nonempty (G ≅ diagonalizable S M)

/-- GS2.1: `G` is fppf-locally diagonalizable (SGA 3, Exp. IX, 1.1, for finite type). -/
def IsMultiplicativeType (G : Grp (Over S)) : Prop :=
  ∃ (ι : Type u) (U : ι → Scheme.{u}) (f : ∀ i, U i ⟶ S),
    (∀ i, Flat (f i)) ∧ (∀ i, LocallyOfFinitePresentation (f i)) ∧
      (∀ s : S, ∃ i, ∃ x : U i, f i x = s) ∧
        ∀ i, IsDiagonalizable ((baseChange (f i)).obj G)

/-- GS2.1: `G` is fppf-locally isomorphic to `D(ℤ^r)`. -/
def IsTorus (G : Grp (Over S)) : Prop :=
  ∃ (ι : Type u) (U : ι → Scheme.{u}) (f : ∀ i, U i ⟶ S),
    (∀ i, Flat (f i)) ∧ (∀ i, LocallyOfFinitePresentation (f i)) ∧
      (∀ s : S, ∃ i, ∃ x : U i, f i x = s) ∧
        ∀ i, ∃ r : ℕ, Nonempty ((baseChange (f i)).obj G ≅
          diagonalizable (U i) (Fin r → ULift.{u} ℤ))

/-- GS2.2: a group of multiplicative type is étale-locally diagonalizable
(SGA 3, Exp. X, Cor. 4.5). -/
theorem IsMultiplicativeType.exists_etale_cover {G : Grp (Over S)}
    (hG : IsMultiplicativeType G) :
    ∃ (ι : Type u) (U : ι → Scheme.{u}) (f : ∀ i, U i ⟶ S),
      (∀ i, Etale (f i)) ∧ (∀ s : S, ∃ i, ∃ x : U i, f i x = s) ∧
        ∀ i, IsDiagonalizable ((baseChange (f i)).obj G) := sorry

/-- GS2.5: tori over a locally noetherian normal base are isotrivial
(SGA 3, Exp. X, 5.16). Normality is expressed through the stalks. -/
theorem IsTorus.isotrivial_of_normal [IsLocallyNoetherian S]
    (hS : ∀ s : S, IsDomain (S.presheaf.stalk s) ∧ IsIntegrallyClosed (S.presheaf.stalk s))
    {G : Grp (Over S)}
    (hG : IsTorus G) :
    ∃ (S' : Scheme.{u}) (f : S' ⟶ S), IsFinite f ∧ Etale f ∧ Surjective f ∧
      IsDiagonalizable ((baseChange f).obj G) := sorry

end GS2

/-! ## GS3: rigidity and Hom schemes -/

section GS3

variable {S : Scheme.{u}}

/-- GS3.2: over a connected base, two homomorphisms between groups of multiplicative type
that agree on one fibre are equal. -/
theorem hom_eq_of_eq_fibre [ConnectedSpace S] {H H' : Grp (Over S)}
    (hH : IsMultiplicativeType H) (hH' : IsMultiplicativeType H') (φ ψ : H ⟶ H') (s : S)
    (h : (baseChange (S.fromSpecResidueField s)).map φ =
      (baseChange (S.fromSpecResidueField s)).map ψ) :
    φ = ψ := sorry

/-- The functor `T ↦ Hom_{T-gr}(H_T, G_T)` on `S`-schemes. -/
def homFunctor (H G : Grp (Over S)) : (Over S)ᵒᵖ ⥤ Type u := sorry

/-- GS3.4: for `H` of multiplicative type and `G` smooth affine, `Hom_{S-gr}(H, G)` is
represented by a smooth separated `S`-scheme (SGA 3, Exp. XI, 4.2). -/
theorem homFunctor_representable {H G : Grp (Over S)} (hH : IsMultiplicativeType H)
    [Smooth G.X.hom] [IsAffineHom G.X.hom] :
    ∃ Y : Over S, Smooth Y.hom ∧ IsSeparated Y.hom ∧
      Nonempty ((homFunctor H G).RepresentableBy Y) := sorry

/-- GS3.4: between groups of multiplicative type the Hom scheme is étale. -/
theorem homFunctor_representable_etale {H H' : Grp (Over S)} (hH : IsMultiplicativeType H)
    (hH' : IsMultiplicativeType H') :
    ∃ Y : Over S, Etale Y.hom ∧ IsSeparated Y.hom ∧
      Nonempty ((homFunctor H H').RepresentableBy Y) := sorry

end GS3

/-! ## GS5: the deformation of `𝔾_m` to `𝔾_a` -/

section GS5

variable {S : Scheme.{u}}

/-- `G^(λ) = Spec_S O_S[t, (1 + λt)⁻¹]` with law `t₁ + t₂ + λ t₁ t₂` (GS5 checks). -/
def deformationGroup (S : Scheme.{u}) (lam : Γ(S, ⊤)) : Grp (Over S) := sorry

theorem smooth_deformationGroup (lam : Γ(S, ⊤)) :
    Smooth (deformationGroup S lam).X.hom := sorry

theorem isAffineHom_deformationGroup (lam : Γ(S, ⊤)) :
    IsAffineHom (deformationGroup S lam).X.hom := sorry

theorem isCommMonObj_deformationGroup (lam : Γ(S, ⊤)) :
    IsCommMonObj (deformationGroup S lam).X := sorry

/-- Over `D(λ)`, `t ↦ 1 + λt` identifies `G^(λ)` with `𝔾_m`. -/
theorem deformationGroup_basicOpen (lam : Γ(S, ⊤)) :
    Nonempty ((baseChange (S.basicOpen lam).ι).obj (deformationGroup S lam) ≅
      multiplicativeGroup (S.basicOpen lam)) := sorry

/-- Over `S` with `λ = 0`, `G^(0)` is the additive group: it is not of multiplicative type
when `S` is nonempty. -/
theorem not_isMultiplicativeType_deformationGroup_zero [Nonempty S] :
    ¬ IsMultiplicativeType (deformationGroup S 0) := sorry

end GS5

end

end TauCetiRoadmap.GroupSchemesOverABase
