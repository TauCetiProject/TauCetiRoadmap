import Mathlib

/-!
# Pro-p and Demushkin groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.

Pinned Mathlib (`9caeba1000`, 2026-06-03) has the `ProfiniteGrp` category with limits, the
finite-quotient limit description, and the profinite completion adjunction, but **no**
continuous cohomology (master grew `RepresentationTheory/Homological/ContCohomology/` in
June–July 2026, still without explicit `H¹`/`H²` or cup products). Consequently the layers
whose statements are inherently cohomological — the presentation rank interpretations
(Layer 5), cohomological dimension (Layer 6), the Demushkin predicate and the canonical
character (Layer 7), the classification (Layer 9), and the arithmetic summit (Layer 11) —
are **prose-only in `README.md`**; we do not fake their conditions here with stand-in
predicates. What *is* statable at the pin is below: the profinite foundations, the
supernatural order, Sylow theory, the pro-`p`/Frattini/generation layers, free pro-`p`
groups with their universal property, the finite-quotient determinacy (reconstruction)
theorem, the lower `p`-series, and the presentation-level worked examples, including the
group `D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y)⟩` of the dyadic acceptance instance.

The `def`s in the Prototypes section pin suggested *forms* for the objects the examples
mention (each is also a design decision recorded in `README.md`); they are prototypes, not
proved-out API.
-/

namespace TauCetiRoadmap.ProPGroups

open CategoryTheory

universe u v

/-! ## Prototypes: suggested forms for the basic objects -/

section Prototypes

variable (p : ℕ)

/-- **Pro-`p`, in quotient form** (the pinned definition; the inverse-limit description is a
derived milestone, Layer 3). A topological group is pro-`p` when each of its continuous finite
quotients — each quotient by an open normal subgroup — is a `p`-group. For a profinite group
this is the usual notion. -/
def IsProP (G : Type u) [Group G] [TopologicalSpace G] : Prop :=
  ∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ U.toSubgroup)

/-- **Topological finite generation**: some finite subset generates a dense subgroup. This is
the predicate the local-fields roadmap's finite-generation theorem (its `B1` layer) produces
and the reconstruction theorem (Layer 8) consumes; keep this exact shape. -/
def IsTopologicallyFinitelyGenerated (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : Prop :=
  ∃ s : Finset G, (Subgroup.closure (s : Set G)).topologicalClosure = ⊤

/-- The **pro-`p` kernel**: the intersection of the open normal subgroups with `p`-group
quotient. The **maximal pro-`p` quotient** is `G ⧸ proPKernel p G`. -/
def proPKernel (G : Type u) [Group G] [TopologicalSpace G] : Subgroup G :=
  ⨅ U : {U : OpenNormalSubgroup G // IsPGroup p (G ⧸ U.toSubgroup)}, U.1.toSubgroup

instance proPKernel_normal (G : Type u) [Group G] [TopologicalSpace G] :
    (proPKernel p G).Normal :=
  Subgroup.normal_iInf_normal fun U ↦ U.1.isNormal'

/-- **`p`-Sylow subgroup of a profinite group**: a closed pro-`p` subgroup whose image in
every continuous finite quotient has index prime to `p` (equivalently: whose supernatural
index is prime to `p`, Layer 1). -/
def IsProPSylow {G : Type u} [Group G] [TopologicalSpace G] (P : Subgroup G) : Prop :=
  IsClosed (P : Set G) ∧ IsProP p P ∧
    ∀ U : OpenNormalSubgroup G, ¬ p ∣ (P.map (QuotientGroup.mk' U.toSubgroup)).index

/-- **Supernatural numbers** (Steinitz orders): formal products `∏_p p^(n_p)` with
`n_p ∈ ℕ∞`, recorded as their exponent functions. Divisibility, product, gcd/lcm, and the
finite-embedding API are Layer 1. -/
abbrev Supernatural : Type := Nat.Primes → ℕ∞

/-- The **order** of a profinite group as a supernatural number: at each prime, the supremum
of the `p`-valuations of its continuous finite quotients. -/
noncomputable def profiniteOrder (G : Type u) [Group G] [TopologicalSpace G] : Supernatural :=
  fun p ↦ ⨆ U : OpenNormalSubgroup G, (padicValNat p (Nat.card (G ⧸ U.toSubgroup)) : ℕ∞)

/-- The **Frattini subgroup of a pro-`p` group**, in index-`p` form: the intersection of the
open normal subgroups of index `p`. (For pro-`p` `G` these are exactly the maximal open
subgroups, and this agrees with `closure (Gᵖ[G,G])` — the Layer 3 milestones; the definition
is stated so that it makes sense for any topological group.) -/
def proPFrattini (G : Type u) [Group G] [TopologicalSpace G] : Subgroup G :=
  ⨅ U : {U : OpenNormalSubgroup G // U.toSubgroup.index = p}, U.1.toSubgroup

/-- Suggested instance form: the topological closure of a normal subgroup is normal (wraps
`Subgroup.is_normal_topologicalClosure`, which is not an instance in Mathlib), so that
quotients by closed normal closures typecheck without boilerplate. -/
instance {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] (N : Subgroup G)
    [N.Normal] : N.topologicalClosure.Normal :=
  Subgroup.is_normal_topologicalClosure N

/-- One step of the **lower `p`-series**: `H ↦ closure (Hᵖ ⬝ [H, G])`, the topological
closure of the subgroup generated by the `p`-th powers from `H` and the commutators
`[H, G]`. -/
def pLowerCentralStep {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (H : Subgroup G) : Subgroup G :=
  (Subgroup.closure ((· ^ p) '' (H : Set G)) ⊔ ⁅H, (⊤ : Subgroup G)⁆).topologicalClosure

/-- The **lower `p`-series** (descending `p`-central series), 0-based to match Mathlib's
`lowerCentralSeries`: `λ₀ = G`, `λ_{k+1} = closure (λ_kᵖ [λ_k, G])`. Labute's `F_i`
(1-based) is `pLowerCentralSeries p F (i - 1)`. -/
def pLowerCentralSeries (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    ℕ → Subgroup G
  | 0 => ⊤
  | k + 1 => pLowerCentralStep p (pLowerCentralSeries G k)

/-- The **free profinite group** on `X`: the profinite completion of the discrete free group
(pinned construction; the universal property is what pins it down). -/
noncomputable abbrev freeProfiniteGroup (X : Type u) : ProfiniteGrp.{u} :=
  ProfiniteGrp.profiniteCompletion.obj (GrpCat.of (FreeGroup X))

/-- The generators of the free profinite group. -/
noncomputable def freeProfiniteGroup.of {X : Type u} (x : X) : freeProfiniteGroup X :=
  ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of (FreeGroup X)) (FreeGroup.of x)

/-- The **free pro-`p` group** on `X`: the maximal pro-`p` quotient of the free profinite
group (equivalently, the pro-`p` completion of the discrete free group). -/
noncomputable abbrev freeProP (X : Type u) : Type u :=
  freeProfiniteGroup X ⧸ proPKernel p (freeProfiniteGroup X)

/-- The generators of the free pro-`p` group. -/
noncomputable def freeProP.of {X : Type u} (x : X) : freeProP p X :=
  QuotientGroup.mk (freeProfiniteGroup.of x)

/-- The pro-`p` group **presented** by generators `X` and relators `rels`: the free pro-`p`
group modulo the *closed* normal closure of the relators (closedness is what keeps the
quotient profinite; the algebraic normal closure need not be closed). -/
noncomputable abbrev presentedProP (X : Type u) (rels : Set (freeProP p X)) : Type u :=
  freeProP p X ⧸ (Subgroup.normalClosure rels).topologicalClosure

/-- The dyadic Demushkin relator `A²S⁴(S,Y)` in the free pro-`2` group on `A, S, Y`
(`= of 0, of 1, of 2`), written out in Labute's commutator convention
`(x, y) = x⁻¹y⁻¹xy` (see the conventions in `README.md`). -/
noncomputable def d0Relator : freeProP 2 (Fin 3) :=
  freeProP.of 2 0 ^ 2 * freeProP.of 2 1 ^ 4 *
    ((freeProP.of 2 1)⁻¹ * (freeProP.of 2 2)⁻¹ * freeProP.of 2 1 * freeProP.of 2 2)

/-- **`D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y) = 1⟩`**, the rank-3, `q = 2` dyadic Demushkin group — the
Layer 11 acceptance instance (`G_{ℚ₂}(2) ≅ D₀`), defined intrinsically as a presented
pro-`2` group. -/
noncomputable abbrev demushkinD0 : Type := presentedProP 2 (Fin 3) {d0Relator}

/-- The **topological abelianization** `G^{ab} = G ⧸ closure [G,G]` — the profinite
abelianization when `G` is profinite; the home of the `q`-invariant. -/
abbrev topAbelianization (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    Type u :=
  G ⧸ (commutator G).topologicalClosure

open Classical in
/-- **Labute's `q`-invariant**: `0` if the topological abelianization is torsion-free
(Labute's `q = p^∞ = 0` convention), and otherwise the number of its torsion elements —
which for a Demushkin group `G`, where `G^{ab} ≅ ℤ_p^{n-1} × ℤ/q`, is exactly `q`. Junk
value for groups whose abelianization torsion is infinite. -/
noncomputable def demushkinQ (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : ℕ :=
  if ∀ x : topAbelianization G, IsOfFinOrder x → x = 1 then 0
  else Nat.card {x : topAbelianization G // IsOfFinOrder x}

/-- `ℤ̂`, the profinite completion of `ℤ` (a stress-test object for Layers 0–2). -/
noncomputable abbrev zHat : Type :=
  ProfiniteGrp.profiniteCompletion.obj (GrpCat.of (Multiplicative ℤ))

end Prototypes

/-! ## Layer 0: profinite foundations -/

/-- **Layer 0, quotients by closed normal subgroups are profinite.** Compactness and the
topological-group property are already instances; the missing ingredient is total
disconnectedness of `G ⧸ N` for `N` closed. (Migrated mathematics: the clopen-basis
argument.) -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (N : Subgroup G) [N.Normal] (hN : IsClosed (N : Set G)) :
    TotallyDisconnectedSpace (G ⧸ N) :=
  sorry

/-- **Layer 0, the completion of a finite group is itself.** The unit of the profinite
completion adjunction is bijective on a finite (discrete) group — the non-vacuity check for
the completion layer. -/
example {G : Type u} [Group G] [Finite G] :
    Function.Bijective (ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of G)) :=
  sorry

/-! ## Layer 1: the supernatural order -/

/-- **Layer 1, the order of a finite group.** On a finite discrete group the supernatural
order is the prime factorization of `Nat.card G` — the compatibility that keeps
`profiniteOrder` honest. -/
example {G : Type u} [Group G] [TopologicalSpace G] [DiscreteTopology G] [Finite G]
    (p : Nat.Primes) : profiniteOrder G p = (padicValNat p (Nat.card G) : ℕ∞) :=
  sorry

/-- **Layer 1 ↔ 3, pro-`p` means order a power of `p`.** A profinite group is pro-`p` iff its
supernatural order is supported at `p` alone. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] :
    IsProP p G ↔ ∀ q : Nat.Primes, (q : ℕ) ≠ p → profiniteOrder G q = 0 :=
  sorry

/-! ## Layer 2: profinite Sylow theory -/

/-- **Layer 2, existence of `p`-Sylow subgroups.** Every profinite group has a `p`-Sylow
subgroup (inverse limit of Sylow subgroups at the finite levels; compactness supplies the
limit point). -/
example (p : ℕ) [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] :
    ∃ P : Subgroup G, IsProPSylow p P :=
  sorry

/-- **Layer 2, conjugacy of `p`-Sylow subgroups.** Any two `p`-Sylow subgroups of a profinite
group are conjugate. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] {P Q : Subgroup G}
    (hP : IsProPSylow p P) (hQ : IsProPSylow p Q) :
    ∃ g : G, Q = P.map (MulAut.conj g).toMonoidHom :=
  sorry

/-- **Layer 2, Galois instance.** The Galois group of any Galois extension, in its Krull
topology, has a `p`-Sylow subgroup (the group-theoretic half of "maximal prime-to-`p`
subextensions exist"; the fixed-field dictionary belongs to the Galois-correspondence API). -/
example (p : ℕ) [Fact p.Prime] {k K : Type u} [Field k] [Field K] [Algebra k K]
    [IsGalois k K] : ∃ P : Subgroup (K ≃ₐ[k] K), IsProPSylow p P :=
  sorry

/-- **Layer 2, the `p`-Sylow subgroup of `ℤ̂`.** Every `p`-Sylow subgroup of the profinite
completion of `ℤ` is isomorphic, as a topological group, to `ℤ_p` — the worked example tying
completion, Sylow theory, and the `p`-adic integers together. -/
example (p : ℕ) [Fact p.Prime] (P : Subgroup zHat) (hP : IsProPSylow p P) :
    Nonempty (P ≃ₜ* Multiplicative ℤ_[p]) :=
  sorry

/-! ## Layer 3: pro-`p` groups, the maximal pro-`p` quotient, Frattini theory, generation -/

/-- **Layer 3, the maximal pro-`p` quotient is pro-`p`.** (Compactness argument: an open
normal subgroup containing the pro-`p` kernel already contains a member of the defining
family.) -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] : IsProP p (G ⧸ proPKernel p G) :=
  sorry

/-- **Layer 3, universal property of the maximal pro-`p` quotient.** Continuous homomorphisms
from `G` to a pro-`p` profinite group factor uniquely through `G(p) = G ⧸ proPKernel p G`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] {P : Type v} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] (hP : IsProP p P)
    (f : G →* P) (hf : Continuous f) :
    ∃! g : G ⧸ proPKernel p G →* P,
      Continuous g ∧ ∀ x : G, g (QuotientGroup.mk x) = f x :=
  sorry

/-- **Layer 3, the Frattini subgroup of a pro-`p` group is `closure (Gᵖ[G,G])`.** The
index-`p` form and the verbal form agree: for pro-`p` `G` the open normal subgroups of index
`p` are exactly the maximal open subgroups, and their intersection is the closure of the
subgroup generated by `p`-th powers and commutators. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G) :
    proPFrattini p G
      = (Subgroup.closure (Set.range fun g : G ↦ g ^ p) ⊔ commutator G).topologicalClosure :=
  sorry

/-- **Layer 3, index-`p` detection (the Frattini generation criterion, subgroup form).** A
closed subgroup of a pro-`p` group contained in no open normal subgroup of index `p` is the
whole group. This is `H · Φ(G) = G → H = G`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    {H : Subgroup G} (hH : IsClosed (H : Set G))
    (h : ∀ U : OpenNormalSubgroup G, U.toSubgroup.index = p → ¬ H ≤ U.toSubgroup) : H = ⊤ :=
  sorry

/-- **Layer 3, the Burnside basis surjectivity criterion (hom form).** A continuous
homomorphism between pro-`p` profinite groups whose composites to all index-`p` quotients of
the target are surjective is surjective — the workhorse for checking surjectivity on
generators mod Frattini. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] {H : Type v}
    [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H]
    [TotallyDisconnectedSpace H] (hH : IsProP p H) (f : G →* H) (hf : Continuous f)
    (hsurj : ∀ U : OpenNormalSubgroup H, U.toSubgroup.index = p →
      Function.Surjective ((QuotientGroup.mk' U.toSubgroup).comp f)) :
    Function.Surjective f :=
  sorry

/-- **Layer 3, the topological finite generation criterion.** A pro-`p` group is
topologically finitely generated iff its Frattini quotient is finite (`index ≠ 0` is
Mathlib's idiom for finiteness of the quotient) — the Burnside basis theorem's counting
half, and the criterion the local-fields roadmap applies to `G_K`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G) :
    IsTopologicallyFinitelyGenerated G ↔ (proPFrattini p G).index ≠ 0 :=
  sorry

/-- **Layer 3, the Gaschütz lifting lemma.** Along a continuous surjection of profinite
groups, a topological generating tuple of the target lifts to a topological generating tuple
of the source, provided the source is generated by that many elements. (Nakayama-style
generator lifting; the engine behind minimal presentations.) -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] {H : Type v} [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H] (f : G →* H)
    (hf : Continuous f) (hfs : Function.Surjective f) {n : ℕ} (g : Fin n → G)
    (hg : (Subgroup.closure (Set.range g)).topologicalClosure = ⊤) (h : Fin n → H)
    (hh : (Subgroup.closure (Set.range h)).topologicalClosure = ⊤) :
    ∃ g' : Fin n → G, (∀ i, f (g' i) = h i) ∧
      (Subgroup.closure (Set.range g')).topologicalClosure = ⊤ :=
  sorry

/-- **Layer 3, finitely generated profinite groups are Hopfian.** A continuous surjective
endomorphism of a topologically finitely generated profinite group is an isomorphism — the
endgame of every two-sided comparison argument (Layer 8). -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hfg : IsTopologicallyFinitelyGenerated G) (f : G →* G)
    (hc : Continuous f) (hs : Function.Surjective f) : Function.Bijective f :=
  sorry

/-- **Layer 3, rank sanity check.** The minimal number of generators of the finite `2`-group
`ℤ/4 × ℤ/2` is `2` — the Burnside-basis numerology (`G/Φ(G) ≅ (ℤ/2)²`) in its abstract
finite instance. -/
example : Group.rank (Multiplicative (ZMod 4) × Multiplicative (ZMod 2)) = 2 :=
  sorry

/-! ## Layer 4: free pro-`p` groups on finite sets -/

/-- **Layer 4, universal property of the free pro-`p` group.** Maps from `X` into a pro-`p`
profinite group extend uniquely to continuous homomorphisms from `freeProP p X`. -/
example {p : ℕ} {X : Type u} {P : Type v} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] (hP : IsProP p P)
    (m : X → P) :
    ∃! f : freeProP p X →* P, Continuous f ∧ ∀ x : X, f (freeProP.of p x) = m x :=
  sorry

/-- **Layer 4, topological finite generation of free pro-`p` groups.** The free pro-`p`
group on a finite set is topologically finitely generated (by the images of the free
generators, which are dense-generating by construction). -/
example {p : ℕ} {X : Type u} [Finite X] : IsTopologicallyFinitelyGenerated (freeProP p X) :=
  sorry

/-- **Layer 4, free groups are residually `p`.** The canonical map from the discrete free
group to the free pro-`p` group is injective — the classical residual `p`-finiteness of free
groups, and the reason the generators of `freeProP` behave like free generators. -/
example {p : ℕ} [Fact p.Prime] {X : Type u} :
    Function.Injective ((QuotientGroup.mk' (proPKernel p (freeProfiniteGroup X))).comp
      (ProfiniteGrp.ProfiniteCompletion.eta (GrpCat.of (FreeGroup X))).hom) :=
  sorry

/-! ## Layer 5: presentations (rank interpretations are prose-only at this pin) -/

/-- **Layer 5, non-vacuity of the presentation machinery.** The presented pro-`2` group
`D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y)⟩` is nontrivial. (A collapse here would make the dyadic
acceptance instance vacuous; the proof maps `D₀` onto a nontrivial finite `2`-group.) -/
example : Nontrivial demushkinD0 :=
  sorry

/-- **Layer 5, presented groups are pro-`p`.** The presentation construction lands in
pro-`2` groups: `D₀` is pro-`2`, and topologically finitely generated. -/
example : IsProP 2 demushkinD0 ∧ IsTopologicallyFinitelyGenerated demushkinD0 :=
  sorry

/-! ## Layer 6: cohomological dimension (prose-only at this pin, except its Nielsen–Schreier
consequence, whose statement is presentation-level) -/

/-- **Layer 6, pro-`p` Nielsen–Schreier for open subgroups, with the index-rank formula.**
An open subgroup of index `m` in the free pro-`p` group of rank `n ≥ 1` is free pro-`p` of
rank `1 + m(n - 1)`. (Route pinned in `README.md`: via `cd ≤ 1` and the Euler-characteristic
count, not a transversal argument.) -/
example {p : ℕ} [Fact p.Prime] {n : ℕ} (hn : n ≠ 0) (U : OpenSubgroup (freeProP p (Fin n))) :
    Nonempty (U ≃ₜ* freeProP p (Fin (1 + U.toSubgroup.index * (n - 1)))) :=
  sorry

/-! ## Layer 7: Demushkin invariants (the cohomological predicate is prose-only at this pin;
the abelianization-level invariants and the ambient `ℤ_pˣ`-subgroup theory are statable) -/

/-- **Layer 7, closed subgroups of `ℤ₂ˣ` avoiding `-1` are procyclic.** The classification
of the possible images of the dyadic orientation character rests on the closed-subgroup
trichotomy for `ℤ₂ˣ = {±1} × (1 + 4ℤ₂)`: the subgroups `U^(f) = 1 + 2^f ℤ₂`,
`{±1} × U^(f)`, and Labute's `U^[f] = closure ⟨-1 + 2^f⟩`; those in the first and third
families — exactly the closed subgroups not containing `-1` — are topologically generated by
one element. -/
example (A : Subgroup ℤ_[2]ˣ) (hA : IsClosed (A : Set ℤ_[2]ˣ)) (h1 : (-1 : ℤ_[2]ˣ) ∉ A) :
    ∃ u : ℤ_[2]ˣ, (Subgroup.closure {u}).topologicalClosure = A :=
  sorry

/-- **Layer 7, the abelianization of `D₀`.** `D₀^{ab} ≅ ℤ₂ × ℤ₂ × ℤ/2` as topological
groups: the relator `A²S⁴(S,Y)` abelianizes to `2A + 4S`, so the topological abelianization
is `ℤ₂³/⟨(2,4,0)⟩`. This is the computation behind `n = 3`, `q = 2`. -/
example : Nonempty (topAbelianization demushkinD0 ≃ₜ* Multiplicative (ℤ_[2] × ℤ_[2] × ZMod 2)) :=
  sorry

/-- **Layer 7, the `q`-invariant of `D₀`.** `q(D₀) = 2`: the torsion subgroup of
`D₀^{ab} ≅ ℤ₂² × ℤ/2` has two elements. -/
example : demushkinQ demushkinD0 = 2 :=
  sorry

/-! ## Layer 8: the lower `p`-series and finite-quotient determinacy -/

/-- **Layer 8, openness of the lower `p`-series.** In a topologically finitely generated
pro-`p` group every term of the lower `p`-series is open. (With cofinality below, the series
is then a neighborhood basis of `1` by finite `p`-quotients — the tower the comparison
method runs on.) -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    (hfg : IsTopologicallyFinitelyGenerated G) (k : ℕ) :
    IsOpen ((pLowerCentralSeries p G k : Subgroup G) : Set G) :=
  sorry

/-- **Layer 8, cofinality of the lower `p`-series.** In a topologically finitely generated
pro-`p` group the lower `p`-series is cofinal among open normal subgroups. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    (hfg : IsTopologicallyFinitelyGenerated G) (U : OpenNormalSubgroup G) :
    ∃ k : ℕ, pLowerCentralSeries p G k ≤ U.toSubgroup :=
  sorry

/-- **Layer 8, finite-quotient determinacy (the reconstruction theorem).** Two topologically
finitely generated profinite groups with the same finite continuous quotients are
isomorphic. (König/compactness assembly of levelwise surjections in both directions, closed
by the Layer 3 Hopfian property. The profinite half of Dixon–Formanek–Poland–Ribes.) -/
example {G H : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : IsTopologicallyFinitelyGenerated G) (hH : IsTopologicallyFinitelyGenerated H)
    (h : ∀ (Q : Type u) [Group Q] [TopologicalSpace Q] [DiscreteTopology Q] [Finite Q],
      (∃ f : G →* Q, Continuous f ∧ Function.Surjective f) ↔
        (∃ f : H →* Q, Continuous f ∧ Function.Surjective f)) :
    Nonempty (G ≃ₜ* H) :=
  sorry

end TauCetiRoadmap.ProPGroups
