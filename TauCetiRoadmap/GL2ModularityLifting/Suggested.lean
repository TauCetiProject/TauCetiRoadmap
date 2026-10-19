import Mathlib

/-!
# GL₂ modularity lifting: representative target signatures

These signatures are suggested forms, not an exhaustive checklist. `README.md` is the definitive
specification. This file records the light definitions and the
statements that can already be made against the pinned Mathlib APIs. It is not an
exhaustive list of the targets of any layer: the Hecke algebras of definite quaternionic forms,
the deformation rings, the patched modules and every lifting theorem need carriers (Galois
representations of number fields with their local conditions, Hilbert modular forms, local
deformation rings) that the pinned libraries do not contain, so they are README targets only.

Design choices.
* The patching radius of Layer 3 is the natural-number expression `s · m · p ^ (m · (h + j))`
  of Kisin's patching datum; the cutoff ideals themselves belong to the patching algebra.
* Oddness is a condition on the characteristic-zero determinant. Over a domain `R` with a ring
  map to a field `k` of characteristic different from two it can be read on the reduction
  (`odd_det_of_odd_reduction`); README §6.2 specifies the dyadic boundary cases.
* The signed prime `p* = (-1) ^ ((p - 1) / 2) * p` is Tau Ceti's
  `TauCeti.Multiquadratic.oddPrimeDiscriminant`, used only for odd primes `p`; Tau Ceti already
  proves `p* ≡ 1 (mod 4)` and that a primitive `p`-th root of unity yields a square root of `p*`.
* Hodge–Tate weights are normalised by `HT(ε) = 1`; distinct weights `a < b` normalise to
  `{0, k − 1}` with `k = b − a + 1` (`normalizedWeight`).
* The avoidance variant (§3.4a) patches modules over the fixed ambient rings A and A′
  without a domain hypothesis; component geometry is used there, before any action quotient.
  The dyadic variant (§6.7a) retains the ambient finite-level Hecke modules, diamond freeness,
  augmentations and twists, and obtains support on a union of ambient components.
* `RankTwoFamily` is the Hodge-forgetting rank-two view of the supplied
  `AutomorphicSystemData`, with a common-good-Frobenius predicate and separate de Rham and
  Weil–Deligne conditions.
* Pan's good components (Layer 10) are stated on concrete data: a family of subsets of a point
  space, the potentially nice points and the seed points. Pan's extension components are the
  minimal primes of the source of a ring map that lie in the image of the target spectrum, for
  the whole target spectrum.
-/

namespace TauCetiRoadmap.GL2ModularityLifting

/-! ## Layer 3: Arithmetic patching -/

/-- The patching radius `r_m = s · m · p ^ (m · (h + j))` of the level-`m` patching datum
(§3.1; Kisin's patching datum, with `s` the rank of the patched module and `h + j` the number of
patching variables). -/
def patchingRadius (s m p hj : ℕ) : ℕ := s * m * p ^ (m * hj)

/-- The radius grows with the level: the transition from level `m + 1` to level `m` is a
reduction, so the level-`m + 1` radius dominates. -/
theorem patchingRadius_mono_level (s p hj : ℕ) (hp : 1 ≤ p) (m : ℕ) :
    patchingRadius s m p hj ≤ patchingRadius s (m + 1) p hj := by
  sorry

/-! ## Layer 7: Statement table and normalisations over ℚ -/

/-- README §7.5(i): a rank-two representation over a field with
nonsolvable image is irreducible. -/
theorem irreducible_of_nonsolvable_image {G k : Type*} [Group G] [Field k]
    (ρ : Representation k G (Fin 2 → k)) (hρ : ¬ Group.IsSolvable ρ.asGroupHom.range) :
    Representation.IsIrreducible ρ := by
  sorry

/-- README §7.5(ii): restriction to a normal subgroup with solvable quotient preserves
nonsolvable image and irreducibility in rank two over a field. -/
theorem nonsolvable_image_restriction {G k : Type*} [Group G] [Field k]
    (ρ : Representation k G (Fin 2 → k)) (hρ : ¬ Group.IsSolvable ρ.asGroupHom.range)
    (N : Subgroup G) [N.Normal] [Group.IsSolvable (G ⧸ N)] :
    ¬ Group.IsSolvable (ρ.asGroupHom.comp N.subtype).range ∧
      Representation.IsIrreducible (ρ.comp N.subtype) := by
  sorry

/-- The normalised weight `k = b − a + 1` of a representation with Hodge–Tate weights `a < b`
(§7.6): twisting by `ε^{−a}` moves the weights to `{0, k − 1}`. -/
def normalizedWeight (a b : ℤ) : ℤ := b - a + 1

/-- Twisting by a power of the cyclotomic character shifts both weights and leaves `k` fixed. -/
theorem normalizedWeight_shift (a b n : ℤ) :
    normalizedWeight (a + n) (b + n) = normalizedWeight a b := by
  sorry

/-- Distinct weights give `k ≥ 2`. -/
theorem two_le_normalizedWeight {a b : ℤ} (h : a < b) : 2 ≤ normalizedWeight a b := by
  sorry

/-- The oddness bridge of §7.10: over a domain, an involution whose reduction to a field of
characteristic different from two has determinant `−1` has determinant `−1`. -/
theorem odd_det_of_odd_reduction {R k : Type*} [CommRing R] [IsDomain R] [Field k]
    (φ : R →+* k) (c : Matrix (Fin 2) (Fin 2) R) (hc : c * c = 1)
    (hres : (c.map φ).det = -1) (h2 : (2 : k) ≠ 0) : c.det = -1 := by
  sorry

/-! ## Layer 10: Pan's residually reducible theorem -/

section GoodComponents

variable {I X : Type*}

/-- Pan's good components (Definition 7.4.1): component `i` is good when a finite chain of
components, each sharing a potentially nice point with the next, joins `i` to a component
containing a potentially nice seed point. `components` lists the irreducible components as
subsets of the point space, `nice` the potentially nice points and `seed` the closure of the
ordinary arithmetic points (§10.3). -/
def panGoodComponent (components : I → Set X) (nice seed : Set X) (i : I) : Prop :=
  ∃ j : I, (∃ x ∈ nice, x ∈ seed ∧ x ∈ components j) ∧
    Relation.ReflTransGen
      (fun a b : I => ∃ x ∈ nice, x ∈ components a ∧ x ∈ components b) j i

/-- README §10.3: goodness is seeded reachability through potentially nice common points. -/
theorem panGoodComponent_iff (components : I → Set X) (nice seed : Set X) (i : I) :
    panGoodComponent components nice seed i ↔
      ∃ j : I, (∃ x ∈ nice, x ∈ seed ∧ x ∈ components j) ∧
        Relation.ReflTransGen
          (fun a b : I => ∃ x ∈ nice, x ∈ components a ∧ x ∈ components b) j i := by
  sorry

/-- A component containing a potentially nice seed point is good. -/
theorem panGoodComponent_seed (components : I → Set X) (nice seed : Set X) (i : I) (x : X)
    (hn : x ∈ nice) (hs : x ∈ seed) (hc : x ∈ components i) :
    panGoodComponent components nice seed i := by
  sorry

/-- Goodness passes along a shared potentially nice point. -/
theorem panGoodComponent_step (components : I → Set X) (nice seed : Set X) {i j : I}
    (hi : panGoodComponent components nice seed i) (x : X) (hn : x ∈ nice)
    (hxi : x ∈ components i) (hxj : x ∈ components j) :
    panGoodComponent components nice seed j := by
  sorry

/-- Enlarging the potentially nice points or the seed preserves goodness. -/
theorem panGoodComponent_mono (components : I → Set X) {nice nice' seed seed' : Set X}
    (hn : nice ⊆ nice') (hs : seed ⊆ seed') {i : I}
    (hi : panGoodComponent components nice seed i) :
    panGoodComponent components nice' seed' i := by
  sorry

/-- README §10.3: equality of the component subsets and point sets preserves goodness. -/
theorem panGoodComponent_congr {components components' : I → Set X}
    {nice nice' seed seed' : Set X} (hc : ∀ i, components i = components' i)
    (hn : nice = nice') (hs : seed = seed') (i : I) :
    panGoodComponent components nice seed i ↔ panGoodComponent components' nice' seed' i := by
  sorry

/-- With no seed points no component is good. -/
example (components : I → Set X) (nice : Set X) (i : I) :
    ¬ panGoodComponent components nice ∅ i := by
  rintro ⟨j, ⟨x, -, hx, -⟩, -⟩
  exact hx

/-- Components `{0}`, `{0, 1}`, `{1, 2}` with nice points `{0, 1}` and seed `{0}` are all good;
the third is reached from the second through the nice point `1`. -/
example : ∀ i : Fin 3,
    panGoodComponent
      (fun j : Fin 3 => if j = 0 then ({0} : Set ℕ) else if j = 1 then {0, 1} else {1, 2})
      {0, 1} {0} i := by
  intro i
  fin_cases i
  · exact ⟨0, ⟨0, by simp, by simp, by simp⟩, Relation.ReflTransGen.refl⟩
  · exact ⟨1, ⟨0, by simp, by simp, by simp⟩, Relation.ReflTransGen.refl⟩
  · exact ⟨1, ⟨0, by simp, by simp, by simp⟩,
      Relation.ReflTransGen.single ⟨1, by simp, by simp, by simp⟩⟩

end GoodComponents

section ExtensionComponents

variable {A B : Type*} [CommRing A] [CommRing B]

/-- Pan's extension components (Definition 7.4.21): the minimal primes of `A` in the image of
`Spec B → Spec A`, for the whole of `Spec B`. In the application `f` is the trace map from the
pseudodeformation ring to the deformation ring of a nonsplit extension (§10.4). -/
def panExtensionComponents (f : A →+* B) : Set (PrimeSpectrum A) :=
  {P | P.asIdeal ∈ minimalPrimes A ∧ P ∈ Set.range (PrimeSpectrum.comap f)}

/-- README §10.4: a detected component is a minimal prime point lifted from the target spectrum. -/
theorem panExtensionComponents_mem_iff (f : A →+* B) (P : PrimeSpectrum A) :
    P ∈ panExtensionComponents f ↔
      P.asIdeal ∈ minimalPrimes A ∧ ∃ Q : PrimeSpectrum B, P = PrimeSpectrum.comap f Q := by
  sorry

/-- README §10.4: the closure of each detected generic point is an irreducible component. -/
theorem panExtensionComponents_minimal (f : A →+* B) {P : PrimeSpectrum A}
    (hP : P ∈ panExtensionComponents f) :
    closure ({P} : Set (PrimeSpectrum A)) ∈ irreducibleComponents (PrimeSpectrum A) := by
  sorry

/-- An extension component contains the kernel of the map. -/
theorem panExtensionComponents_kernel_le (f : A →+* B) {P : PrimeSpectrum A}
    (hP : P ∈ panExtensionComponents f) : RingHom.ker f ≤ P.asIdeal := by
  sorry

/-- Along the identity every minimal prime is an extension component. -/
theorem panExtensionComponents_id :
    panExtensionComponents (RingHom.id A) = {P : PrimeSpectrum A | P.asIdeal ∈ minimalPrimes A} := by
  sorry

/-- Composing with a further map can only shrink the set. -/
theorem panExtensionComponents_comp_subset {C : Type*} [CommRing C] (f : A →+* B) (g : B →+* C) :
    panExtensionComponents (g.comp f) ⊆ panExtensionComponents f := by
  sorry

/-- A zero target detects no component. -/
example [Subsingleton B] (f : A →+* B) : panExtensionComponents f = ∅ := by
  refine Set.eq_empty_iff_forall_notMem.2 fun P hP => ?_
  obtain ⟨Q, -⟩ := hP.2
  exact Q.isPrime.ne_top (Subsingleton.elim _ _)

end ExtensionComponents

/-!
## Targets stated in the README only

The higher arithmetic targets use carriers (Galois representations of number fields with local conditions, Hilbert and
quaternionic eigenforms, global and local deformation rings, patched modules, completed
cohomology, and the shared `AutomorphicSystemData` view `RankTwoFamily`) absent from the pinned libraries; the README states those targets with
their intended signatures.

* Layer 1: the arithmetic input to GlobalGaloisDeformations §§6.7–6.8’s
  `HeckeGaloisDatum`, its point construction and classifying surjection; `MinimalLevelData`,
  `ResidualModularAlpha`, `ResidualModularBeta`, `defToHecke`,
  `framedHecke`, `framedHeckeModule`, `defToHeckeFramed`; allowable base changes with prescribed
  completions (`cht_soluble_prescribed_completions`); surjectivity and faithfulness after framing.
* Layer 2: `auxLevel`, `auxDelta`, `auxHecke`, `auxMaxIdeal`, `defToAuxHecke`, `twModule`;
  freeness and control at Taylor–Wiles levels.
* Layers 3–4: `PatchingDatum` (with `patchingRadius` above), the patched ring and module,
  their support, finiteness of the minimal deformation ring, `avoidancePair`, integral and
  generic-fibre `R = T`. The formally smooth case of §4.2 consumes
  DeformationAndDerivedPatchingAlgebra §§5.5–5.6’s `patching_surjection_iso`, with independent
  finite-level data, equal variable counts, nonzero module and faithful target action, for the
  isomorphism, freeness and complete-intersection conclusions. The avoidance pair and its API
  require `p > 2`; §3.4a constructs
  the simultaneous ambient modules over A and A′, with common special-fibre actions and
  augmentations, without using the domain-case ring-module criterion.
* Layers 5–6: `StronglyResiduallyModular`, `bcdtHeckeModule`, `DyadicPatchingDatum`,
  `dyadicPatchedRing`, `dyadicPatchedModule`, `dyadicTorusAction`; the Khare–Wintenberger,
  Kisin, Fontaine–Laffaille and BCDT lifting theorems, KW I Theorem 4.1 and
  Hypothesis (H). Section 5.16 imports ClassicalSerreModularity §I.2,
  `I.2/same-weight-crystalline-lifting`, including its crystalline-domain comparison;
  §5.17 supplies the matching-weight endpoint seed. Sections 5.2 and 5.12 use the spherical
  comparison level U′_S GL₂(ℤ_ℓ) and induction to return to U₀(ℓ), before the extended-type
  projection. The case division in §5.18 uses the finite-order twist before asserting type (C).
  Section 6.7a constructs ambient dyadic module patching and union-of-components support;
  §6.8 uses that support and the local same-component criteria. Sections 6.11–6.14 retain
  their domain-base hypotheses. Section 5.9 uses the restricted overlap of
  OrdinaryAutomorphicFormsAndModularityLifting §5.6; any use of its full-scope §5.8
  carries its `CMComponentSupport` hypothesis.
* Layers 7–9: `OddPrimeLifting`, `DyadicLifting`, `ResiduallyReducibleLifting`,
  `OrdinaryThreeLifting`, the classification of geometric twists, `patchedWeightFiltration`,
  Kisin's multiplicity criterion and the de Rham lifting theorems at odd primes and at `2`.
  Residual attachment and modularity over ℚ use the supplied
  `TauCeti.ResidualModularity.ArisesFrom` and `TauCeti.ResidualModularity.IsModular` of
  AlgebraicModularFormsAndSerreWeights Layer R15.6; its integral-model comparison identifies
  the representation itself under absolute irreducibility and otherwise only its semisimplification.
  Section 8.6 concludes modularity up to a global character twist for arbitrary distinct
  weights, with the labelled Hilbert weight and central-character convention of the README;
  normalized weights `{0,k−1}` over ℚ give exact weight-k modularity through §§7.9 and 7.11.
* Layers 10–12: `PanNicePrime`, `PanPotentiallyNicePrime` (with `panGoodComponent` and
  `panExtensionComponents` above), Pan's residually reducible theorem, the ordinary `3`-adic
  completion and the transfer statements along congruences. Section 10.5 retains residual
  modularity, local absolute irreducibility and the p = 3 exclusions, and concludes modularity
  up to a geometric global character twist. Its normalized-weight corollary uses §§7.11 and 7.9.
  Sections 12.2–12.3 use normalized
  weights `{0,k−1}` with `k≥2` for exact modularity. The Pan branch carries the
  twist-two rational dual vanishing hypothesis LC and CC1–CC5. The odd irreducible branch
  carries LL1–LL3 and CC4–CC5, the dyadic branch CC1 and CC4–CC5, and the ordinary branch
  imports ClassicalSerreModularity §I.1 through OrdinaryAutomorphicFormsAndModularityLifting.
* Layer 0: odd-involution descent and Pan’s one-dimensional completion and bounded-denominator
  trace/deformation comparisons, using the native determinants, Cayley–Hamilton algebras, GMAs,
  reducibility ideals and Ribet lattices of IntegralHeckeAndGaloisDeterminants §§0.5, 1.2–1.4.
  Section 10.7a imports `PadicBaker.eq_zero_of_add_sum_mul_eq_zero` from
  LinearFormsInLogarithms §8.10; its common-power logarithm adapter gives `abelian_leopoldt`
  and the Galois-rank and reducible-locus dimension consequences. Section 5.8 imports the
  general unramified Fontaine–Laffaille smoothness theorem of LocalGaloisDeformationRings §3.10
  with its residual Fontaine–Laffaille, regular-width and nonempty fixed-determinant hypotheses.
-/

end TauCetiRoadmap.GL2ModularityLifting
