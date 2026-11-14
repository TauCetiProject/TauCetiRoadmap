module

public import Mathlib
public import TauCeti.RingTheory.FormalGroup.Hom
public import TauCeti.RingTheory.FormalGroup.Height.Basic
public import TauCeti.RingTheory.FormalGroup.Height.Ideal
public import TauCeti.RingTheory.FormalGroup.CoordinateChange.HopfAlgebroid

/-!
# Bordism, formal groups and chromatic operations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`.

Statable at the pins, and stated below: Lazard's classification of
one-dimensional commutative formal groups over a separably closed field of
characteristic `p` by their height (F1), on Tau Ceti's bundled isomorphisms
`TauCeti.FormalGroupIso` and height `FormalGroup.height`; Landweber's
classification of the homogeneous invariant prime ideals of the Lazard ring
(F5), on Tau Ceti's `TauCeti.LazardRing` with its grading, the right unit of
its Hopf algebroid of strict coordinate changes and the height ideals
`FormalGroup.heightIdeal`; and the Lubin–Tate universal deformation theorem
for a formal group of finite height (F5), over Mathlib's power series,
complete noetherian local rings and `FormalGroup.map`, with the one
definition it needs, the ⋆-isomorphisms `IsStarIso`. F1.5's algebraic
theory of `p`-typical laws (Cartier's theorem, the universal `p`-typical
ring `V` and its Hopf algebroid) is a README target on the route to the
classification, not a headline, and is stated nowhere here. The rest of
F1 (the `n`-series, the Lazard ring with its universality and polynomial
theorem, the symmetric cocycle lemma, the coordinate-change Hopf algebroid
with the invariance of the height ideals, the invariant differential,
logarithm and exponential, the exponent-two normalized logarithm and its
universal ring) consists of theorems of the pinned Tau Ceti, consumed by
the README and stated nowhere here; so does the uniqueness of the
⋆-isomorphism in the Lubin–Tate theorem
(`TauCeti.FormalGroupIso.eq_of_map_residue_eq`).

Not statable at the pins, and stated nowhere in this file: Quillen's theorem
`L ≅ MU_*` and Thom's computation of `π_*MO` (the pinned point-set
`TauCeti.SymmetricSpectrum` has no stable model structure, stable homotopy
category or stable homotopy groups, and there are no Thom spectra `MU`, `MO`
and no Eilenberg–MacLane spectra); Bousfield's existence of the
homological localization `L_E` (F6.1: no stable homotopy category of
spectra, no derived smash products and no derived function spectra); the
Conner–Floyd and graded Eilenberg–MacLane comparisons for `MO` (no `MO`, no
graded Eilenberg–MacLane spectrum `H(MO_*)`, no represented homology
theories); the Landweber exact functor theorem (no `MU_*MU`-comodules, and
no comodules over Tau Ceti's Lazard Hopf algebroid); the Devinatz–Hopkins–Smith
nilpotence theorem and the Hopkins–Smith thick-subcategory classification
and periodicity theorem (no stable homotopy category, no finite `p`-local
spectra, no Morava `K(n)`); the Hopkins–Ravenel smashing theorem, the
chromatic fracture square and the `K(n)`-local completion formula (no
homological Bousfield localizations of spectra, no `E(n)`- or `K(n)`-local
categories, no homotopy limits of spectra); the Greenlees–Sadofsky/Kuhn
Tate vanishing (no Morava `K(n)`, no Tate construction); the torus Euler
cancellation of F6.6 (no `MU`-module families over `BT`, no Thom-cocone
Euler maps); and the module-extension nullhomotopy theorem of F6.7 (no
`MU`-module families over `BT` and no classification of their extensions).
-/

@[expose] public section

noncomputable section
namespace TauCetiRoadmap.BordismFormalGroups

/-! ## Layer 1: F1. Formal-group algebra and universality -/

/-- F1 (Lazard): over a separably closed field `k` of characteristic `p`, two commutative
one-dimensional formal groups are isomorphic exactly when their heights agree, the infinite
height (the class of the additive group) included (Ravenel, Theorem A2.2.12). The forward
direction and the infinite-height case are theorems of the pinned Tau Ceti
(`TauCeti.FormalGroupIso.height_eq`, `FormalGroup.height_eq_top_iff_nonempty_formalGroupIso_𝔾ₐ`);
the finite-height converse needs the separable closure. -/
theorem nonempty_formalGroupIso_iff_height_eq {k : Type*} [Field k] [IsSepClosed k]
    (p : ℕ) [Fact p.Prime] [CharP k p] (F G : FormalGroup k) [F.IsComm] [G.IsComm] :
    Nonempty (TauCeti.FormalGroupIso F G) ↔ F.height p = G.height p := by
  sorry

/-! ## Layer 5: F5. Exact functors, deformations and elliptic inputs -/

/-- F5 (Landweber, Morava): a homogeneous ideal `I` of the Lazard ring `L` is prime and
invariant under the Hopf algebroid `(L, L[b₁, b₂, …])` of strict coordinate changes, that is,
its extensions along the right unit and along the left unit `MvPolynomial.C` agree, exactly
when it is a height ideal `I_(p,n)` of the universal formal group law for a prime `p` and some
`n ≥ 0` (with `I_(p,0) = 0`), or their union `I_(p,∞)` (Ravenel, *Complex Cobordism*,
Theorem 1.3.16(iv), p. 17; Theorem 4.3.2(iv), p. 121, for `BP_*`). The homogeneity is
essential: `(2, a₁₁ - 1)` is an invariant prime ideal that is not homogeneous. Invariance of
every `I_(p,n)` is `TauCeti.LazardRing.map_rightUnit_heightIdeal`. -/
theorem isPrime_and_invariant_iff_eq_heightIdeal {I : Ideal TauCeti.LazardRing}
    (hI : I.IsHomogeneous TauCeti.LazardRing.grading) :
    (I.IsPrime ∧ I.map TauCeti.LazardRing.rightUnit = I.map MvPolynomial.C) ↔
      ∃ p : ℕ, p.Prime ∧
        ((∃ n : ℕ, I = TauCeti.LazardRing.formalGroup.heightIdeal p n) ∨
          I = ⨆ n, TauCeti.LazardRing.formalGroup.heightIdeal p n) := by
  sorry

/-- A ⋆-isomorphism relative to a ring homomorphism `π : A →+* k` (Lubin–Tate): an
isomorphism of formal groups over `A` whose forward series reduces along `π` to the identity
series `X`. When it exists, the two formal groups have the same reduction along `π`. -/
def IsStarIso {A k : Type*} [CommRing A] [CommRing k] (π : A →+* k) {G H : FormalGroup A}
    (e : TauCeti.FormalGroupIso G H) : Prop :=
  PowerSeries.map π e.toHom.toPowerSeries = PowerSeries.X

/-- F5 (Lubin–Tate 1966, Theorem 3.1, with the generic law of Proposition 1.1): let `k` be a
field of characteristic `p`, `ρ : R →+* k` a surjective ring homomorphism and `F₀` a
commutative one-dimensional formal group over `k` of finite height `h` (so `h ≥ 1`). There is
a commutative formal group `Γ` over `R[[t₁, …, t_{h-1}]]` reducing to `F₀` such that, for every
complete noetherian local `R`-algebra `A` with residue map `π : A → k` compatible with `ρ` and
every commutative lift `G` of `F₀` to `A`, exactly one `R`-algebra map `θ` sending each `tᵢ`
into the maximal ideal makes `Γ` base-changed along `θ` ⋆-isomorphic to `G`. The
⋆-isomorphism is then unique by the pinned rigidity `TauCeti.FormalGroupIso.eq_of_map_residue_eq`
(Lubin–Tate 1966, Proposition 2.4, p. 52, and the last sentence of Theorem 3.1). For a perfect
field `k`, `R = W(k)` with `ρ = WittVector.constantCoeff` gives the Lubin–Tate ring
`W(k)[[t₁, …, t_{h-1}]]`. -/
theorem lubinTate_universal_deformation {p : ℕ} [Fact p.Prime] {k : Type*} [Field k]
    [CharP k p] {R : Type*} [CommRing R] (ρ : R →+* k) (hρ : Function.Surjective ρ)
    (F₀ : FormalGroup k) [F₀.IsComm] {h : ℕ} (hF₀ : F₀.height p = h) :
    ∃ Γ : FormalGroup (MvPowerSeries (Fin (h - 1)) R), Γ.IsComm ∧
      Γ.map (ρ.comp MvPowerSeries.constantCoeff) = F₀ ∧
      ∀ (A : Type*) [CommRing A] [IsLocalRing A] [IsNoetherianRing A]
        [IsAdicComplete (IsLocalRing.maximalIdeal A) A] [Algebra R A]
        (π : A →+* k), Function.Surjective π → RingHom.ker π = IsLocalRing.maximalIdeal A →
        π.comp (algebraMap R A) = ρ →
        ∀ (G : FormalGroup A) [G.IsComm], G.map π = F₀ →
        ∃! θ : MvPowerSeries (Fin (h - 1)) R →ₐ[R] A,
          (∀ i, θ (MvPowerSeries.X i) ∈ IsLocalRing.maximalIdeal A) ∧
          ∃ e : TauCeti.FormalGroupIso (Γ.map θ.toRingHom) G, IsStarIso π e := by
  sorry

end TauCetiRoadmap.BordismFormalGroups
