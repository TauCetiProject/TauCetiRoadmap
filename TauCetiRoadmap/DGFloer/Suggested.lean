module

public import Mathlib
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.FundamentalClass
public import TauCeti.Geometry.Symplectic.Cotangent.Bundle.Liouville
public import TauCeti.Geometry.Symplectic.Hamiltonian.AlmostExistence

/-!
# Morse and Floer homology with DG local coefficients: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`. Discharging the
statements here finishes neither a layer nor the roadmap.

Stated here:

* the mod-2 vanishing theorem (README Layer 1 item 4): a simply connected space with vanishing
  reduced mod-2 singular homology has uniquely 2-divisible higher homotopy groups;
* the source's Theorem 5.10, the general form of its Theorem A (README Layer 10 item 5): on the
  cotangent bundle of a closed connected oriented manifold `Q`, every regular level of a proper
  function enclosing the image of a closed smooth oriented manifold mapping to `Q` with nonzero
  degree `d` has the contractible almost existence property, provided `π₂(Q) ≠ 0`, or the first
  nonzero `π_k(Q)`, `k ≥ 3`, has an element not killed by `d`, or some `π_ℓ(Q)`, `ℓ ≥ 3`, is
  killed by no power `d^m`; on the pinned carriers `TauCeti.CotangentBundle.symplecticForm`,
  `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence` and
  `TauCeti.HomologicalOrientation.mapFundamentalClass`;
* Theorem A of the source in its two cases (README Layer 10 item 5): the same conclusion when `Q`
  is not aspherical and `d = ±1`, respectively when `Q` is not rationally aspherical and `d ≠ 0`;
* the source's Theorem 5.15, the general form of its Theorem C (README Layer 10 item 5): the same
  conclusion on the cotangent bundle of a closed connected non-orientable manifold `Q` with
  `π₂(Q) ≠ 0` or `π_ℓ(Q) ⊗ ℤ/2 ≠ 0` for some `ℓ ≥ 3`, for a closed smooth manifold mapping to `Q`
  with nonzero mod-2 degree, the degree read on Mathlib's singular homology with coefficients in
  `ZMod 2`;
* Theorem C of the source (README Layer 10 item 5): the same conclusion when
  `π_ℓ(Q) ⊗ ℤ/2 ≠ 0` for some `ℓ ≥ 2`;
* the torus criterion (README Layer 11 item 3): a compact connected Lie group is aspherical
  exactly when it is a torus.

The source's Lemma 3.41 (README Layer 10 item 4) is the pinned
`TauCeti.isAspherical_iff_doubleLoopSpace_singularHomology`, and the twisted complex of a twisting
cocycle (README Layer 4) is the pinned `TauCeti.TwistingCocycle.twistedCochainComplex`; neither is
restated here.

Not statable at the pins, each with the carrier it lacks:

* Theorems L and M (README Layer 10 items 1–2): symplectic homology with DG coefficients, its
  spectral invariants, and DG Morse homology of `(W, ∂W)`; the capacities they bound are pinned
  (`TauCeti.SmoothTwoForm.relContractibleHZCapacity`,
  `TauCeti.SmoothTwoForm.contractibleHZCapacity`).
* Theorem J and the comparison `FH_*(X; 𝓕) ≅ H_{*+n}(X; i_X^*𝓕)` (README Layer 8 item 6): the
  Hamiltonian Floer complex, hence moduli spaces of Floer cylinders.
* Theorem K, the DG Viterbo isomorphism (README Layer 9 item 3): symplectic homology `SH_*` and
  DG Morse homology of the free loop space.
* The fibration theorem `H_*(B; C_*(F')) ≅ H_*(E)` (README Layer 5 item 4): the DG Morse complex,
  that is, the Barraud–Cornea twisting cocycle of the compactified Morse trajectory spaces; the
  loop DG algebra, the DG local system `TauCeti.fibrationLocalSystem` of a map and the twisted
  complex of a twisting cocycle are pinned.
* The Arnold bound on contractible 1-periodic orbits (README Layer 7.C.6g): the first Chern class
  on spherical classes, for the spherical monotonicity hypothesis; the pinned Floer cap classes
  take the Chern number as an abstract homomorphism.
* The Floer–Novikov torsion invariant (README Layer 7.T.8): Floer complexes over Novikov rings.
-/

@[expose] public section

namespace TauCetiRoadmap.DGFloer

universe u

open scoped unitInterval ContDiff

/-! ## Layer 1: topological prerequisites -/

open scoped Topology in
/-- **Mod-2 vanishing** (README Layer 1 item 4). A simply connected space `Y` whose singular
homology with coefficients in the abelian group `ℤ/2` vanishes in every positive degree has
every higher homotopy group uniquely 2-divisible: squaring is a bijection on `π_{n+2}(Y, y)`.
The coefficients are Mathlib's singular homology with values in `ModuleCat ℤ`, evaluated on the
`ℤ`-module `ZMod 2`, lifted to the universe of `Y`. The proof is the one-step lemma of the
README, iterated through the Whitehead tower, with the mod-2 Serre spectral sequence and the
vanishing of `H̃_*(K(A, n); 𝔽₂)` for a `ℤ[1/2]`-module `A`. -/
theorem bijective_sq_homotopyGroup_of_mod_two_acyclic (Y : TopCat.{u}) [SimplyConnectedSpace Y]
    (hY : ∀ n : ℕ, 1 ≤ n → Subsingleton
      (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) n).obj
        (ModuleCat.of ℤ (ULift.{u} (ZMod 2)))).obj Y))
    (n : ℕ) (y : Y) : Function.Bijective (fun a : π_ (n + 2) Y y ↦ a ^ 2) := sorry

/-! ## Layer 10: the criteria and their applications to cotangent bundles -/

section AlmostExistence

open TauCeti
open scoped Manifold Topology

variable {E : Type} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- **The source's Theorem 5.10**, the general form of its Theorem A (README Layer 10 item 5).
Let `Q` be a closed connected oriented `n`-manifold, `S` a closed smooth oriented `n`-manifold,
and `φ : S → T*Q` continuous such that `π ∘ φ` has nonzero degree `d`:
`(π ∘ φ)_*[S] = d • [Q]` in `H_n(Q; ℤ)`. Assume that `π₂(Q) ≠ 0`, or that `π₃(Q), …, π_{k+2}(Q)`
vanish and `π_{k+3}(Q)`, the first nonzero group among the `π_j(Q)` with `j ≥ 3`, has an element
`a` with `a^d ≠ 1` (an element not of `d`-torsion), or that some `π_{ℓ+3}(Q)` has, for every
`m ≥ 1`, an element `a` with `a^(d^m) ≠ 1` (it is of `d^m`-torsion for no `m`). Let
`F : T*Q → ℝ` be smooth with compact sublevel sets, `c` a regular value of `F`, and `F < c` on
`φ(S)`. Then `F⁻¹(c)` has the contractible almost existence property for `ω = -dλ`. The route is
README Layer 10 items 3–4: the cotangent criterion, the kernel of `i_{Q*}` (the source's
Proposition 5.11) and the `d`-torsion of `ker π_{U!}` (its Proposition 5.13). -/
theorem hasContractibleAlmostExistence_of_degree_ne_zero {Q S : Type} [TopologicalSpace Q]
    [T2Space Q] [ChartedSpace E Q] [IsManifold 𝓘(ℝ, E) ∞ Q] [CompactSpace Q] [ConnectedSpace Q]
    [TopologicalSpace S] [T2Space S] [ChartedSpace E S] [IsManifold 𝓘(ℝ, E) ∞ S]
    [CompactSpace S]
    (oQ : HomologicalOrientation Q E (Module.finrank ℝ E))
    (oS : HomologicalOrientation S E (Module.finrank ℝ E)) (q : Q)
    (φ : C(S, CotangentBundle 𝓘(ℝ, E) Q)) {d : ℤ}
    (hd : oS.mapFundamentalClass rfl
        ((⟨Bundle.TotalSpace.proj, FiberBundle.continuous_proj _ _⟩ :
          C(CotangentBundle 𝓘(ℝ, E) Q, Q)).comp φ) =
      d • oQ.mapFundamentalClass rfl (ContinuousMap.id Q))
    (hd₀ : d ≠ 0)
    (hQ : Nontrivial (π_ 2 Q q) ∨
      (∃ k : ℕ, (∀ j < k, Subsingleton (π_ (j + 3) Q q)) ∧ ∃ a : π_ (k + 3) Q q, a ^ d ≠ 1) ∨
      ∃ ℓ : ℕ, ∀ m : ℕ, 1 ≤ m → ∃ a : π_ (ℓ + 3) Q q, a ^ (d ^ m) ≠ 1)
    (F : CotangentBundle 𝓘(ℝ, E) Q → ℝ)
    (hF : ContMDiff (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) ∞ F)
    (hFc : ∀ b : ℝ, IsCompact (F ⁻¹' Set.Iic b)) {c : ℝ}
    (hc : IsRegularValue (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) F c) (hφ : ∀ s, F (φ s) < c) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) Q).HasContractibleAlmostExistence Set.univ F c :=
  sorry

/-- **Theorem A of the source, first case** (README Layer 10 item 5; the source's Theorem A,
proved as its Theorem 5.10). Let `Q` be a closed connected oriented `n`-manifold that is not
aspherical, `S` a closed smooth oriented `n`-manifold (smooth, as in the source's Theorem 5.10:
the route uses the Morse Umkehr map `(π ∘ φ)_!` of README Layer 5 item 3), and `φ : S → T*Q`
continuous such that `π ∘ φ` has degree `d = ±1`: `(π ∘ φ)_*[S] = d • [Q]` in `H_n(Q; ℤ)`. Let
`F : T*Q → ℝ` be smooth with compact sublevel sets, `c` a regular value of `F`, and `F < c` on
`φ(S)`, so that the hypersurface `F⁻¹(c)` bounds the relatively compact domain `{F < c}`
containing `φ(S)`. Then `F⁻¹(c)` has the contractible almost existence property for the canonical
symplectic form `ω = -dλ`: for some `ε > 0`, almost every regular level `F⁻¹(c')` with
`|c' - c| < ε` carries a closed characteristic contractible in `T*Q`. The source's form
`Σ dpᵢ ∧ dqᵢ` is `-ω`, and almost existence does not see the sign of the form. -/
theorem hasContractibleAlmostExistence_of_not_isAspherical {Q S : Type} [TopologicalSpace Q]
    [T2Space Q] [ChartedSpace E Q] [IsManifold 𝓘(ℝ, E) ∞ Q] [CompactSpace Q] [ConnectedSpace Q]
    [TopologicalSpace S] [T2Space S] [ChartedSpace E S] [IsManifold 𝓘(ℝ, E) ∞ S]
    [CompactSpace S]
    (oQ : HomologicalOrientation Q E (Module.finrank ℝ E))
    (oS : HomologicalOrientation S E (Module.finrank ℝ E)) (q : Q) (hQ : ¬ IsAspherical Q q)
    (φ : C(S, CotangentBundle 𝓘(ℝ, E) Q)) {d : ℤ}
    (hd : oS.mapFundamentalClass rfl
        ((⟨Bundle.TotalSpace.proj, FiberBundle.continuous_proj _ _⟩ :
          C(CotangentBundle 𝓘(ℝ, E) Q, Q)).comp φ) =
      d • oQ.mapFundamentalClass rfl (ContinuousMap.id Q))
    (hd₁ : IsUnit d) (F : CotangentBundle 𝓘(ℝ, E) Q → ℝ)
    (hF : ContMDiff (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) ∞ F)
    (hFc : ∀ b : ℝ, IsCompact (F ⁻¹' Set.Iic b)) {c : ℝ}
    (hc : IsRegularValue (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) F c) (hφ : ∀ s, F (φ s) < c) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) Q).HasContractibleAlmostExistence Set.univ F c :=
  sorry

/-- **Theorem A of the source, second case** (README Layer 10 item 5; the source's Theorem A,
proved as its Theorem 5.10). As in the first case, with the hypotheses on `Q` and on the degree
exchanged: `Q` is not a rational `K(π, 1)`, that is, some `π_ℓ(Q)` with `ℓ ≥ 2` has nonzero
rationalization `π_ℓ(Q) ⊗ ℚ`, equivalently is not a torsion group, and the degree `d` of `π ∘ φ`
is nonzero. As in the first case `S` is a closed smooth oriented `n`-manifold. -/
theorem hasContractibleAlmostExistence_of_not_isTorsion_homotopyGroup {Q S : Type}
    [TopologicalSpace Q] [T2Space Q] [ChartedSpace E Q] [IsManifold 𝓘(ℝ, E) ∞ Q] [CompactSpace Q]
    [ConnectedSpace Q] [TopologicalSpace S] [T2Space S] [ChartedSpace E S]
    [IsManifold 𝓘(ℝ, E) ∞ S] [CompactSpace S]
    (oQ : HomologicalOrientation Q E (Module.finrank ℝ E))
    (oS : HomologicalOrientation S E (Module.finrank ℝ E)) (q : Q)
    (hQ : ∃ n : ℕ, ¬ IsMulTorsion (π_ (n + 2) Q q))
    (φ : C(S, CotangentBundle 𝓘(ℝ, E) Q)) {d : ℤ}
    (hd : oS.mapFundamentalClass rfl
        ((⟨Bundle.TotalSpace.proj, FiberBundle.continuous_proj _ _⟩ :
          C(CotangentBundle 𝓘(ℝ, E) Q, Q)).comp φ) =
      d • oQ.mapFundamentalClass rfl (ContinuousMap.id Q))
    (hd₀ : d ≠ 0) (F : CotangentBundle 𝓘(ℝ, E) Q → ℝ)
    (hF : ContMDiff (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) ∞ F)
    (hFc : ∀ b : ℝ, IsCompact (F ⁻¹' Set.Iic b)) {c : ℝ}
    (hc : IsRegularValue (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) F c) (hφ : ∀ s, F (φ s) < c) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) Q).HasContractibleAlmostExistence Set.univ F c :=
  sorry

/-- **The source's Theorem 5.15**, the general form of its Theorem C (README Layer 10 item 5).
Let `Q` be a closed connected non-orientable `n`-manifold (it has no homological orientation)
with `π₂(Q) ≠ 0`, or with `π_ℓ(Q) ⊗ ℤ/2 = π_ℓ(Q)/2π_ℓ(Q)` nonzero for some `ℓ ≥ 3`, that is,
squaring not surjective on `π_ℓ(Q, q)`. Let `S` be a closed smooth `n`-manifold and
`φ : S → T*Q` continuous such that `π ∘ φ` induces a nonzero map `H_n(S; ℤ/2) → H_n(Q; ℤ/2)`.
For connected `S` this says that `π ∘ φ` has mod-2 degree `1`; for disconnected `S` it says that
some component of `S` does, and the source's statement for that component gives the same
conclusion. Let `F`, `c` be as in Theorem 5.10, with `F < c` on `φ(S)`. Then `F⁻¹(c)` has the
contractible almost existence property for `ω = -dλ`. When `π₂(Q) ≠ 0` the double loop space
`Ω²Q` is disconnected, which already gives the mod-2 criterion; otherwise the route is the mod-2
vanishing theorem of README Layer 1 item 4 applied to `Ω₀Q`. -/
theorem hasContractibleAlmostExistence_of_mod_two_degree_ne_zero {Q S : Type}
    [TopologicalSpace Q] [T2Space Q] [ChartedSpace E Q] [IsManifold 𝓘(ℝ, E) ∞ Q] [CompactSpace Q]
    [ConnectedSpace Q] [TopologicalSpace S] [T2Space S] [ChartedSpace E S]
    [IsManifold 𝓘(ℝ, E) ∞ S] [CompactSpace S]
    (hQo : IsEmpty (HomologicalOrientation Q E (Module.finrank ℝ E))) (q : Q)
    (hQ : Nontrivial (π_ 2 Q q) ∨
      ∃ n : ℕ, ¬ Function.Surjective (fun a : π_ (n + 3) Q q ↦ a ^ 2))
    (φ : C(S, CotangentBundle 𝓘(ℝ, E) Q))
    (hφ : ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) (Module.finrank ℝ E)).obj
        (ModuleCat.of ℤ (ZMod 2))).map (TopCat.ofHom
          ((⟨Bundle.TotalSpace.proj, FiberBundle.continuous_proj _ _⟩ :
            C(CotangentBundle 𝓘(ℝ, E) Q, Q)).comp φ)) ≠ 0)
    (F : CotangentBundle 𝓘(ℝ, E) Q → ℝ)
    (hF : ContMDiff (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) ∞ F)
    (hFc : ∀ b : ℝ, IsCompact (F ⁻¹' Set.Iic b)) {c : ℝ}
    (hc : IsRegularValue (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) F c) (hφc : ∀ s, F (φ s) < c) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) Q).HasContractibleAlmostExistence Set.univ F c :=
  sorry

/-- **Theorem C of the source** (README Layer 10 item 5; the source's Theorem C, proved as its
Theorem 5.15). As in Theorem 5.15, with the hypothesis on `Q` that it is not a `ℤ/2`-`K(π, 1)`:
for some `ℓ ≥ 2`, `π_ℓ(Q) ⊗ ℤ/2` is nonzero, that is, squaring is not surjective on
`π_ℓ(Q, q)`. -/
theorem hasContractibleAlmostExistence_of_not_surjective_sq_homotopyGroup {Q S : Type}
    [TopologicalSpace Q] [T2Space Q] [ChartedSpace E Q] [IsManifold 𝓘(ℝ, E) ∞ Q] [CompactSpace Q]
    [ConnectedSpace Q] [TopologicalSpace S] [T2Space S] [ChartedSpace E S]
    [IsManifold 𝓘(ℝ, E) ∞ S] [CompactSpace S]
    (hQo : IsEmpty (HomologicalOrientation Q E (Module.finrank ℝ E))) (q : Q)
    (hQ : ∃ n : ℕ, ¬ Function.Surjective (fun a : π_ (n + 2) Q q ↦ a ^ 2))
    (φ : C(S, CotangentBundle 𝓘(ℝ, E) Q))
    (hφ : ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) (Module.finrank ℝ E)).obj
        (ModuleCat.of ℤ (ZMod 2))).map (TopCat.ofHom
          ((⟨Bundle.TotalSpace.proj, FiberBundle.continuous_proj _ _⟩ :
            C(CotangentBundle 𝓘(ℝ, E) Q, Q)).comp φ)) ≠ 0)
    (F : CotangentBundle 𝓘(ℝ, E) Q → ℝ)
    (hF : ContMDiff (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) ∞ F)
    (hFc : ∀ b : ℝ, IsCompact (F ⁻¹' Set.Iic b)) {c : ℝ}
    (hc : IsRegularValue (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) F c) (hφc : ∀ s, F (φ s) < c) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) Q).HasContractibleAlmostExistence Set.univ F c :=
  sorry

end AlmostExistence

/-! ## Layer 11: the finite cover of a compact connected Lie group -/

/-- **The torus criterion** (README Layer 11 item 3): a compact connected Lie group is
aspherical exactly when it is isomorphic, as a topological group, to a torus `(S¹)^r`. The
proof is through the finite covering `T × K → G` of README Layer 11 item 1 and `π₃(K) ≠ 0` for a
nontrivial compact simply connected semisimple `K` (item 2). -/
theorem isAspherical_iff_exists_continuousMulEquiv_torus
    {E H G : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
    (I₀ : ModelWithCorners ℝ E H) [TopologicalSpace G] [ChartedSpace H G] [Group G]
    [LieGroup I₀ ∞ G] [CompactSpace G] [ConnectedSpace G] :
    TauCeti.IsAspherical G 1 ↔ ∃ r : ℕ, Nonempty (G ≃ₜ* (Fin r → Circle)) := sorry

end TauCetiRoadmap.DGFloer
