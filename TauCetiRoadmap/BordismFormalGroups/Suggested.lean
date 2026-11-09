module

public import Mathlib
public import TauCeti.RingTheory.FormalGroup.Hom
public import TauCeti.RingTheory.FormalGroup.Height.Basic

/-!
# Bordism, formal groups and chromatic operations: target signatures

The roadmap is README.md; this file is not the roadmap. It states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each
with `sorry`.

Statable at the pins, and stated below: Lazard's classification of
one-dimensional commutative formal groups over a separably closed field of
characteristic `p` by their height (F1), on Tau Ceti's bundled isomorphisms
`TauCeti.FormalGroupIso` and height `FormalGroup.height`; and the Lubin–Tate
universal deformation theorem for a formal group of finite height (F5), over
Mathlib's power series, complete noetherian local rings and
`FormalGroup.map`, with the one definition it needs, the ⋆-isomorphisms
`IsStarIso`. The rest of F1 (the `n`-series, the Lazard ring with its
universality and polynomial theorem, the symmetric cocycle lemma, the
coordinate-change Hopf algebroid, the invariant differential, logarithm and
exponential, the exponent-two normalized logarithm and its universal ring)
consists of theorems of the pinned Tau Ceti, consumed by the README and
stated nowhere here.

Not statable at the pins, and stated nowhere in this file: Quillen's theorem
`L ≅ MU_*` and Thom's computation of `π_*MO` (the pinned point-set
`TauCeti.SymmetricSpectrum` has no stable model structure, stable homotopy
category or stable homotopy groups, and there are no Thom spectra `MU`, `MO`
and no Eilenberg–MacLane spectra); the Conner–Floyd and graded
Eilenberg–MacLane comparisons for `MO` (no `MO`, no graded Eilenberg–MacLane
spectrum `H(MO_*)`, no represented homology theories); the Landweber exact
functor theorem (no `MU_*MU`-comodules); the Devinatz–Hopkins–Smith
nilpotence theorem and the Hopkins–Smith thick-subcategory classification
and periodicity theorem (no stable homotopy category, no finite `p`-local
spectra, no Morava `K(n)`); the Hopkins–Ravenel smashing theorem, the
chromatic fracture square and the `K(n)`-local completion formula (no
homological Bousfield localizations of spectra, no `E(n)`- or `K(n)`-local
categories, no homotopy limits of spectra); the Greenlees–Sadofsky/Kuhn
Tate vanishing (no Morava `K(n)`, no Tate construction); and the torus
Euler cancellation of F6.6 (no `MU`-module families over `BT`, no
Thom-cocone Euler maps).
-/

@[expose] public section

noncomputable section
namespace TauCetiRoadmap.BordismFormalGroups

/-! ## F1: formal-group algebra and universality -/

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

/-! ## F5: exact functors, deformations and elliptic inputs -/

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
into the maximal ideal makes `Γ` base-changed along `θ` ⋆-isomorphic to `G`, by exactly one
⋆-isomorphism. For a perfect field `k`, `R = W(k)` with `ρ = WittVector.constantCoeff` gives
the Lubin–Tate ring `W(k)[[t₁, …, t_{h-1}]]`. -/
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
          ∃! e : TauCeti.FormalGroupIso (Γ.map θ.toRingHom) G, IsStarIso π e := by
  sorry

end TauCetiRoadmap.BordismFormalGroups
