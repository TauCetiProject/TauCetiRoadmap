module

public import Mathlib
public import TauCeti.Algebra.AlgebraicGroup.DiagonalizableGroup.Scheme.Basic
public import TauCeti.AlgebraicGeometry.AbelianVariety.Basic

/-!
# Group schemes over a base: target signatures

The roadmap is `README.md`. This file states the roadmap's headline theorems against the pinned
Mathlib and Tau Ceti, each with `sorry`, together with the definitions their statements need, all
with real bodies on native carriers: Mathlib's `Grp (Over S)`, base change
`(Over.pullback f).mapGrp`, and Tau Ceti's `TauCeti.DiagonalizableGroup.groupScheme`. The API
around each target, the special cases and the Checks stay in the README.

Headline theorems stated here (README target, Lean name):

* 0.2, `exists_identityComponent` (the identity component of a smooth group scheme over an
  arbitrary base), on `baseChange` (0.1).
* 1.2, `bijective_diagonalizableMap`; 1.3, `smooth_diagonalizable_iff` and
  `etale_diagonalizable_iff`; 1.4, `flat_surjective_diagonalizableMap` and
  `isKernel_diagonalizableMap`; on `diagonalizable` and `diagonalizableMap` (1.1).
* 2.2, `IsMultiplicativeType.exists_etale_cover`; 2.5, `IsMultiplicativeType.isotrivial` and
  `IsMultiplicativeType.isotrivial_component`; 2.6, `exists_torus_not_isotrivial`; on
  `IsDiagonalizable`, `IsMultiplicativeType`, `IsTorus` (2.1), `IsIsotrivial` (2.5) and
  `nodalCurve` (2.6).
* 3.1, `bijective_baseChange_map_of_thickening`; 3.2, `hom_eq_of_eq_fibre`; 3.3,
  `eq_of_eq_on_torsion`.
* 4.2, `chevalley`; 4.3, `affinization`.

Not statable at the pins, with the carrier each lacks:

* 1.5 (Cartier duality over a scheme): over `Spec R` it is Tau Ceti's
  `TauCeti.DiagonalizableGroup.cartierDualIso`; over a scheme it needs the Cartier dual of finite
  locally free groups over a scheme of ModularCurves 0B.
* 1.6 (torsors under `D_S(M)`): `NonabelianH1` of SchemeAndStackFoundations §2.3.
* 2.3, 2.4 and 2.7 (the character sheaf, its Galois description, cocharacters and subtori): the
  big-site sheaf `𝔾_m` of SchemeAndStackFoundations §2.9, of which `X*(H)` is the sheaf of
  homomorphisms.
* 3.1 for a smooth affine target (étale-local lifting, conjugacy), 3.4 (Hom schemes) and 3.5
  (centralizers, normalizers): the functors `T ↦ Hom_{T-gr}(H_T, G_T)` and `Z_G(H)`, which need
  the monoidal coherence isomorphisms `baseChange (g ≫ f) ≅ baseChange f ⋙ baseChange g` of 0.1.
* 4.1 (quotients over a field): the fppf quotient sheaf and the quotient predicates of
  SchemeAndStackFoundations §1.17.
* 4.4 and Layer 5 (rank invariants, maximal tori over a base, specialization): maximal tori,
  radicals and centralizers of tori on `Grp (Over (Spec k))`; Tau Ceti has maximal tori on Hopf
  algebras over a field (`TauCeti.HopfIdeal.IsMaximalTorus`) only.
* Layer 6 (line bundles `𝓛(λ)` and Picard groups of `G/B⁻`) and Layer 7 (Steinberg map,
  cross-section, universal centralizer, Grothendieck–Springer, Picard groups of `G` and `G^reg`):
  the pinned split models `𝒢_R` of ReductiveGroups 9B and the scheme of Borel subgroups of
  ReductiveGroups Layer 8.
-/

@[expose] public section

universe u

namespace TauCetiRoadmap.GroupSchemesOverABase

open CategoryTheory Limits AlgebraicGeometry

noncomputable section

/-! ## Layer 0: carriers over a base -/

section Layer0

variable {S : Scheme.{u}}

/-- **0.1.** Base change of group schemes along `f : S' ⟶ S`: Mathlib's `Functor.mapGrp` of the
pullback functor on over categories. -/
def baseChange {S' : Scheme.{u}} (f : S' ⟶ S) : Grp (Over S) ⥤ Grp (Over S') :=
  (Over.pullback f).mapGrp

/-- **0.2.** A smooth group scheme over an arbitrary base has an open subgroup scheme, smooth and
quasi-compact over the base, with connected fibres (SGA 3, Exp. VI_B, 3.9 and 3.10). It is
unique: its fibre at `s` is an open connected subgroup of the fibre of `G`, hence its identity
component. -/
theorem exists_identityComponent (G : Grp (Over S)) [Smooth G.X.hom] :
    ∃ (H : Grp (Over S)) (ι : H ⟶ G), IsOpenImmersion ((Grp.forget (Over S)).map ι).left ∧
      Smooth H.X.hom ∧ QuasiCompact H.X.hom ∧ ∀ s : S, ConnectedSpace (H.X.hom.fiber s) := by
  sorry

end Layer0

/-! ## Layer 1: diagonalizable groups over a base -/

section Layer1

/-- **1.1.** The diagonalizable group `D_S(M)` of a finitely generated abelian group `M`: the base
change along `S ⟶ Spec ℤ` of Tau Ceti's `Spec ℤ[M]`, with `M` written multiplicatively. -/
def diagonalizable (S : Scheme.{u}) (M : Type u) [AddCommGroup M] [AddGroup.FG M] :
    Grp (Over S) :=
  (baseChange (specULiftZIsTerminal.from S)).obj
    (TauCeti.DiagonalizableGroup.groupScheme (ULift.{u} ℤ)
      (TauCeti.FGCommGrpCat.of (Multiplicative M)))

/-- **1.1.** The homomorphism `D(φ) : D_S(M) ⟶ D_S(N)` induced by `φ : N →+ M`
(contravariance, Convention 3). -/
def diagonalizableMap (S : Scheme.{u}) {M N : Type u} [AddCommGroup M] [AddGroup.FG M]
    [AddCommGroup N] [AddGroup.FG N] (φ : N →+ M) :
    diagonalizable S M ⟶ diagonalizable S N :=
  (baseChange (specULiftZIsTerminal.from S)).map
    (TauCeti.DiagonalizableGroup.groupSchemeMap (ULift.{u} ℤ)
      (TauCeti.FGCommGrpCat.ofHom (AddMonoidHom.toMultiplicative φ)))

variable {S : Scheme.{u}} {M N : Type u} [AddCommGroup M] [AddGroup.FG M] [AddCommGroup N]
  [AddGroup.FG N]

/-- **1.2.** Over a connected (hence nonempty) base, `φ ↦ D(φ)` is a bijection from `N →+ M` onto
the homomorphisms `D_S(M) ⟶ D_S(N)` (SGA 3, Exp. VIII, 1.6). -/
theorem bijective_diagonalizableMap [ConnectedSpace S] :
    Function.Bijective (fun φ : N →+ M ↦ diagonalizableMap S φ) := by
  sorry

/-- **1.3.** `D_S(M)` is smooth over `S` iff the order of the torsion subgroup of `M` is
invertible on `S` (SGA 3, Exp. VIII, 2.1 e)). -/
theorem smooth_diagonalizable_iff :
    Smooth (diagonalizable S M).X.hom ↔
      ∀ s : S, ((Nat.card (AddCommGroup.torsion M) : ℕ) : S.residueField s) ≠ 0 := by
  sorry

/-- **1.3.** Over a nonempty base, `D_S(M)` is étale over `S` iff `M` is finite and its order is
invertible on `S` (SGA 3, Exp. VIII, 2.1 c), e)). -/
theorem etale_diagonalizable_iff [Nonempty S] :
    Etale (diagonalizable S M).X.hom ↔
      Finite M ∧ ∀ s : S, ((Nat.card M : ℕ) : S.residueField s) ≠ 0 := by
  sorry

/-- **1.4.** For an injective `φ : N →+ M`, `D(φ) : D_S(M) ⟶ D_S(N)` is faithfully flat
(SGA 3, Exp. VIII, 3.2 a)). -/
theorem flat_surjective_diagonalizableMap {φ : N →+ M} (hφ : Function.Injective φ) :
    Flat ((Grp.forget (Over S)).map (diagonalizableMap S φ)).left ∧
      Surjective ((Grp.forget (Over S)).map (diagonalizableMap S φ)).left := by
  sorry

/-- **1.4.** For an injective `φ : N →+ M`, the kernel of `D(φ)` is `D_S(M ⧸ φ.range)`, embedded
by the quotient map `M → M ⧸ φ.range` (SGA 3, Exp. VIII, 3.1). -/
theorem isKernel_diagonalizableMap {φ : N →+ M} (hφ : Function.Injective φ) :
    ∃ h : diagonalizableMap S (QuotientAddGroup.mk' φ.range) ≫ diagonalizableMap S φ = 0,
      Nonempty (IsLimit (KernelFork.ofι _ h)) := by
  sorry

end Layer1

/-! ## Layer 2: groups of multiplicative type and tori -/

section Layer2

variable {S : Scheme.{u}}

/-- **2.1.** `G` is isomorphic to `D_S(M)` for a finitely generated `M`. -/
def IsDiagonalizable (G : Grp (Over S)) : Prop :=
  ∃ (M : Type u) (_ : AddCommGroup M) (_ : AddGroup.FG M), Nonempty (G ≅ diagonalizable S M)

/-- **2.1.** `G` is of multiplicative type (of finite type): diagonalizable after base change to
the members of an fppf cover. SGA 3, Exp. IX, 1.1, uses fpqc covers; for finite type the two
agree, both being étale-local by SGA 3, Exp. X, 4.5 (README 2.2). -/
def IsMultiplicativeType (G : Grp (Over S)) : Prop :=
  ∃ (ι : Type u) (U : ι → Scheme.{u}) (f : ∀ i, U i ⟶ S),
    (∀ i, Flat (f i)) ∧ (∀ i, LocallyOfFinitePresentation (f i)) ∧
      (∀ s : S, ∃ i, ∃ x : U i, f i x = s) ∧
        ∀ i, IsDiagonalizable ((baseChange (f i)).obj G)

/-- **2.1.** `G` is a torus: fppf-locally isomorphic to `D(M)` with `M` free of finite rank. -/
def IsTorus (G : Grp (Over S)) : Prop :=
  ∃ (ι : Type u) (U : ι → Scheme.{u}) (f : ∀ i, U i ⟶ S),
    (∀ i, Flat (f i)) ∧ (∀ i, LocallyOfFinitePresentation (f i)) ∧
      (∀ s : S, ∃ i, ∃ x : U i, f i x = s) ∧
        ∀ i, ∃ (M : Type u) (_ : AddCommGroup M) (_ : AddGroup.FG M), Module.Free ℤ M ∧
          Nonempty ((baseChange (f i)).obj G ≅ diagonalizable (U i) M)

/-- **2.2.** A group of multiplicative type is étale-locally diagonalizable
(SGA 3, Exp. X, 4.5). -/
theorem IsMultiplicativeType.exists_etale_cover {G : Grp (Over S)}
    (hG : IsMultiplicativeType G) :
    ∃ (ι : Type u) (U : ι → Scheme.{u}) (f : ∀ i, U i ⟶ S),
      (∀ i, Etale (f i)) ∧ (∀ s : S, ∃ i, ∃ x : U i, f i x = s) ∧
        ∀ i, IsDiagonalizable ((baseChange (f i)).obj G) := by
  sorry

/-- **2.5.** `G` is isotrivial: diagonalizable after one finite étale surjective base change.
By the anti-equivalence of 2.3 this says that the character sheaf `X*(G)` is trivialised by a
finite étale cover (README 2.5). -/
def IsIsotrivial (G : Grp (Over S)) : Prop :=
  ∃ (S' : Scheme.{u}) (f : S' ⟶ S), IsFinite f ∧ Etale f ∧ Surjective f ∧
    IsDiagonalizable ((baseChange f).obj G)

/-- **2.5.** Over a connected, locally noetherian, normal base, every group of multiplicative
type is isotrivial (SGA 3, Exp. X, 5.16, there for geometrically unibranch bases). Normality is
expressed through the stalks. -/
theorem IsMultiplicativeType.isotrivial [ConnectedSpace S] [IsLocallyNoetherian S]
    (hS : ∀ s : S, IsDomain (S.presheaf.stalk s) ∧ IsIntegrallyClosed (S.presheaf.stalk s))
    {G : Grp (Over S)} (hG : IsMultiplicativeType G) :
    IsIsotrivial G := by
  sorry

/-- **2.5.** Componentwise form, without connectedness: over a locally noetherian normal base,
the restriction to every connected open and closed subscheme is isotrivial. -/
theorem IsMultiplicativeType.isotrivial_component [IsLocallyNoetherian S]
    (hS : ∀ s : S, IsDomain (S.presheaf.stalk s) ∧ IsIntegrallyClosed (S.presheaf.stalk s))
    {G : Grp (Over S)} (hG : IsMultiplicativeType G) (U : S.Opens)
    (hU : IsClopen (U : Set S)) [ConnectedSpace U] :
    IsIsotrivial ((baseChange U.ι).obj G) := by
  sorry

/-- **2.6.** The nodal curve over a field `k`: `𝔸¹_k` with the points `0` and `1` identified,
the spectrum of `{f ∈ k[t] | f(0) = f(1)}`. -/
def nodalCurve (k : Type u) [Field k] : Scheme.{u} :=
  Spec (CommRingCat.of (AlgHom.equalizer (Polynomial.aeval (R := k) (0 : k))
    (Polynomial.aeval (1 : k))))

/-- **2.6.** Over the nodal curve there is a torus of rank two that is not isotrivial: the
gluing of `𝔾_m²` over `𝔸¹` along `0` and `1` by `[[1, 1], [0, 1]]` (SGA 3, Exp. X, 1.6). -/
theorem exists_torus_not_isotrivial (k : Type u) [Field k] :
    ∃ T : Grp (Over (nodalCurve k)), IsTorus T ∧ ¬ IsIsotrivial T := by
  sorry

end Layer2

/-! ## Layer 3: rigidity, density of torsion, Hom schemes, centralizers -/

section Layer3

variable {S : Scheme.{u}}

attribute [local instance] Hom.monoid

/-- **3.1.** Along a thickening `S₀ ⟶ S` (a surjective closed immersion), homomorphisms between
groups of multiplicative type lift uniquely (SGA 3, Exp. X, 2.1). -/
theorem bijective_baseChange_map_of_thickening {S₀ : Scheme.{u}} (i : S₀ ⟶ S)
    [IsClosedImmersion i] [Surjective i] {H H' : Grp (Over S)} (hH : IsMultiplicativeType H)
    (hH' : IsMultiplicativeType H') :
    Function.Bijective (fun φ : H ⟶ H' ↦ (baseChange i).map φ) := by
  sorry

/-- **3.2.** Over a connected base, two homomorphisms between groups of multiplicative type that
agree on the fibre at one point are equal (SGA 3, Exp. IX, 5.1 and 5.3). -/
theorem hom_eq_of_eq_fibre [ConnectedSpace S] {H H' : Grp (Over S)}
    (hH : IsMultiplicativeType H) (hH' : IsMultiplicativeType H') (φ ψ : H ⟶ H') (s : S)
    (h : (baseChange (S.fromSpecResidueField s)).map φ =
      (baseChange (S.fromSpecResidueField s)).map ψ) :
    φ = ψ := by
  sorry

/-- **3.3.** Density of torsion: two `S`-morphisms from a group of multiplicative type `H` to a
separated `S`-scheme that agree on every `n`-torsion subgroup `H[n]`, the pullback of the unit
section along `x ↦ xⁿ`, are equal (SGA 3, Exp. IX, 4.7). -/
theorem eq_of_eq_on_torsion {H : Grp (Over S)} (hH : IsMultiplicativeType H) {Y : Over S}
    [IsSeparated Y.hom] (φ ψ : H.X ⟶ Y)
    (h : ∀ n : ℕ, 0 < n →
      pullback.fst ((𝟙 H.X) ^ n) MonObj.one ≫ φ = pullback.fst ((𝟙 H.X) ^ n) MonObj.one ≫ ψ) :
    φ = ψ := by
  sorry

end Layer3

/-! ## Layer 4: smooth groups over a field -/

section Layer4

variable (k : Type u) [Field k]

/-- **4.2.** Chevalley's theorem, existence: a smooth connected group scheme of finite type over a
perfect field is an extension of an abelian variety by a smooth connected affine closed normal
subgroup (Conrad, *A modern proof of Chevalley's theorem*, Thm. 1.1). -/
theorem chevalley [PerfectField k] (G : Grp (Over (Spec (CommRingCat.of k))))
    [Smooth G.X.hom] [QuasiCompact G.X.hom] [ConnectedSpace G.X.left] :
    ∃ (L : Grp (Over (Spec (CommRingCat.of k)))) (ι : L ⟶ G)
      (A : TauCeti.AlgebraicGeometry.AbelianVariety k)
      (q : G ⟶ Grp.mk A.toOver) (h : ι ≫ q = 0),
      Nonempty (IsLimit (KernelFork.ofι ι h)) ∧ IsClosedImmersion ((Grp.forget _).map ι).left ∧
        IsAffineHom L.X.hom ∧ Smooth L.X.hom ∧ ConnectedSpace L.X.left ∧
          Flat ((Grp.forget _).map q).left ∧ Surjective ((Grp.forget _).map q).left := by
  sorry

/-- **4.3.** Affinization: for a group scheme of finite type over a field, `O(G)` is a finitely
generated `k`-algebra and `G ⟶ Spec O(G)` is faithfully flat (Demazure–Gabriel, III, §3, 8.2). -/
theorem affinization (G : Grp (Over (Spec (CommRingCat.of k))))
    [LocallyOfFiniteType G.X.hom] [QuasiCompact G.X.hom] :
    G.X.hom.appTop.hom.FiniteType ∧ Flat G.X.left.toSpecΓ ∧ Surjective G.X.left.toSpecΓ := by
  sorry

end Layer4

end

end TauCetiRoadmap.GroupSchemesOverABase
