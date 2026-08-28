import Mathlib
import TauCetiRoadmap.ProfiniteCohomology.Suggested

set_option autoImplicit false

/-!
# Profinite and pro-`p` groups: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library: these are goals, not proofs.

This file carries the carrier types, so that the central interface of the roadmap is Lean
code and not pseudocode. The cohomology is Mathlib's `continuousCohomology`, described in low
degrees, compared, and equipped with its exact sequences, change-of-group maps and cup
products by the Profinite Cohomology roadmap; this file imports those declarations under the
namespace `TauCetiRoadmap.ProfiniteCohomology` and states the pro-`p` theory against them. The
coefficient object of the pro-`p` theory is `trivialFp`, the trivial `𝔽_p`-representation, with
`cohomFp` for its cohomology and `fpPairing` for the multiplication pairing that gives the cup
square. The Demushkin predicate, the rank and `q` invariants, and the prescription property that
pins a canonical character are all stated against those objects. Arithmetic identification with
local absolute Galois groups is owned by `LocalGaloisGroups`.

Everything else is here too: the profinite foundations, the supernatural
order and index, Sylow theory, the pro-`p`, Frattini and generation layers, the free pro-`C`
class formalism, free pro-`p` groups with their universal property, the finite-quotient
determinacy theorem, the lower `p`-series with its graded pieces, the completed group algebra
and Labute's relation module, the closed-subgroup theory of `ℤ₂ˣ`, and the presentation-level
worked examples, including the abstract group `D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y)⟩` with its marked
generators and standard orientation.

Three generic constructions are deliberately **absent**, with their own exact owner — the
successor roadmap `ProfiniteArithmetic` (README, opening section): the profinite integers as a
topological commutative *ring*, the profinite power with a `ℤ̂` exponent on an arbitrary
profinite group together with its `ℤ_ℓ` comparison, and the continuous automorphism and
outer-automorphism groups. `zHat` below is the profinite *group*, which is all this roadmap's
own milestones use.

The `def`s in the Prototypes section pin suggested *forms* for the objects the examples
mention (each is also a design decision recorded in `README.md`); they are prototypes, not
proved-out API.
-/

namespace TauCetiRoadmap.ProfiniteProPGroups

open CategoryTheory

-- Every cohomological operation below is a declaration of `TauCetiRoadmap.ProfiniteCohomology`,
-- written `ProfiniteCohomology.foo` because this file lives inside `TauCetiRoadmap`. This
-- roadmap builds no second carrier and no second operation.

universe u v w

/-! ## Prototypes: suggested forms for the basic objects -/

section Prototypes

variable (p : ℕ)

/-- **Pro-`p`, in quotient form** (the pinned definition; the inverse-limit description is a
derived milestone, Layer 3). A topological group is pro-`p` when each of its continuous finite
quotients, that is each quotient by an open normal subgroup, is a `p`-group. For a profinite
group this is the usual notion. -/
def IsProP (G : Type u) [Group G] [TopologicalSpace G] : Prop :=
  ∀ U : OpenNormalSubgroup G, IsPGroup p (G ⧸ U.toSubgroup)

/-- **Topological finite generation**: some finite subset generates a dense subgroup. This is
the predicate used by the reconstruction theorem (Layer 8) and exported to downstream
consumers; keep this exact shape. -/
def IsTopologicallyFinitelyGenerated (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : Prop :=
  ∃ s : Finset G, (Subgroup.closure (s : Set G)).topologicalClosure = ⊤

/-- A subset **converges to `1`**: every open normal subgroup omits only finitely many of its
elements. Finite sets converge to `1`, and for a profinite group this is the condition under
which a generating set has a well-behaved cardinality (Layer 3). -/
def ConvergesToOne {G : Type u} [Group G] [TopologicalSpace G] (s : Set G) : Prop :=
  ∀ U : OpenNormalSubgroup G, {x ∈ s | x ∉ U.toSubgroup}.Finite

/-- **Topological generator rank, cardinal-valued**: the least cardinality of a subset
converging to `1` and generating a dense subgroup. This is the form all general rank theorems
take (bases, rank invariance, monotonicity, the infinite-rank theory of Layer 10). Every
profinite group has a generating set converging to `1` (RZ Prop. 2.6.2, a Layer 3 milestone),
so the infimum is over a nonempty family.

⚠ Dropping `ConvergesToOne` changes the invariant: a product of continuum many copies of
`ℤ/p` has a countable dense subgroup but needs `2 ^ ℵ₀` generators converging to `1`. -/
noncomputable def topologicalGeneratorRank (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : Cardinal.{u} :=
  ⨅ s : {s : Set G // ConvergesToOne s ∧ (Subgroup.closure s).topologicalClosure = ⊤},
    Cardinal.mk ↥s.1

/-- **Topological generator rank, natural-number accessor**, available exactly when the group
is topologically finitely generated. Every numerical rank statement (finite presentations,
deficiency, the Schreier and Euler formulas, anything involving subtraction) is about this
declaration, never about `topologicalGeneratorRank`. The two are tied together by the theorem
`(topologicalGeneratorRankNat G h : Cardinal) = topologicalGeneratorRank G` below. -/
noncomputable def topologicalGeneratorRankNat (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (_h : IsTopologicallyFinitelyGenerated G) : ℕ :=
  sInf {n : ℕ | ∃ s : Finset G,
    s.card = n ∧ (Subgroup.closure (s : Set G)).topologicalClosure = ⊤}

/-- The **pro-`p` kernel**: the intersection of the open normal subgroups with `p`-group
quotient. The **maximal pro-`p` quotient** is `maximalProPQuotient p G`, below; `G(p)` is
prose for it, and no other name for either object appears in this roadmap. -/
def proPKernel (G : Type u) [Group G] [TopologicalSpace G] : Subgroup G :=
  ⨅ U : {U : OpenNormalSubgroup G // IsPGroup p (G ⧸ U.toSubgroup)}, U.1.toSubgroup

instance proPKernel_normal (G : Type u) [Group G] [TopologicalSpace G] :
    (proPKernel p G).Normal :=
  Subgroup.normal_iInf_normal fun U ↦ U.1.isNormal'

/-- The **maximal pro-`p` quotient** `G(p) = G ⧸ proPKernel p G`. -/
abbrev maximalProPQuotient (G : Type u) [Group G] [TopologicalSpace G] : Type u :=
  G ⧸ proPKernel p G

/-- **`p`-Sylow subgroup of a profinite group**: a closed pro-`p` subgroup whose image in
every continuous finite quotient has index prime to `p` (equivalently: whose supernatural
index is prime to `p`, Layer 1). -/
def IsProPSylow {G : Type u} [Group G] [TopologicalSpace G] (P : Subgroup G) : Prop :=
  IsClosed (P : Set G) ∧ IsProP p P ∧
    ∀ U : OpenNormalSubgroup G, ¬ p ∣ (P.map (QuotientGroup.mk' U.toSubgroup)).index

/-- **Supernatural numbers** (Steinitz orders): formal products `∏_p p^(n_p)` with
`n_p ∈ ℕ∞`, recorded as their exponent functions. Divisibility, product, gcd/lcm, and the
finite-embedding API are Layer 1. This is the only use of `ℕ∞` in the roadmap; generator
counts are cardinals or naturals, never `ℕ∞`. -/
abbrev Supernatural : Type := Nat.Primes → ℕ∞

/-- The **order** of a profinite group as a supernatural number: at each prime, the supremum
of the `p`-valuations of its continuous finite quotients. -/
noncomputable def profiniteOrder (G : Type u) [Group G] [TopologicalSpace G] : Supernatural :=
  fun p ↦ ⨆ U : OpenNormalSubgroup G, (padicValNat p (Nat.card (G ⧸ U.toSubgroup)) : ℕ∞)

/-- The **index of a closed subgroup**, in the pinned primewise form: at each prime `ℓ`, the
supremum over open normal `N` of `v_ℓ [G/N : HN/N]`. The definition is written for arbitrary
`H`; closedness of `H` is a hypothesis of the theorems about it, in particular of the
equivalence with `lcm {[G : U] | U open, H ≤ U}` (Layer 1), which fails without it. -/
noncomputable def profiniteIndex {G : Type u} [Group G] [TopologicalSpace G]
    (H : Subgroup G) : Supernatural :=
  fun ℓ ↦ ⨆ N : OpenNormalSubgroup G,
    (padicValNat ℓ ((H.map (QuotientGroup.mk' N.toSubgroup)).index) : ℕ∞)

/-- The **Frattini subgroup of a pro-`p` group**, in index-`p` form: the intersection of the
open normal subgroups of index `p`. (For pro-`p` `G` these are exactly the maximal open
subgroups, and this agrees with `closure (Gᵖ[G,G])`, the Layer 3 milestones; the definition
is stated so that it makes sense for any topological group.) -/
def proPFrattini (G : Type u) [Group G] [TopologicalSpace G] : Subgroup G :=
  ⨅ U : {U : OpenNormalSubgroup G // U.toSubgroup.index = p}, U.1.toSubgroup

instance proPFrattini_normal (G : Type u) [Group G] [TopologicalSpace G] :
    (proPFrattini p G).Normal :=
  Subgroup.normal_iInf_normal fun U ↦ U.1.isNormal'

/-- The topological closure of a normal subgroup is normal, wrapping Mathlib's
`Subgroup.is_normal_topologicalClosure`, which is deliberately not an instance there. We make
it a **scoped** instance rather than a global one: it fires on every `topologicalClosure`
goal, and a global instance would compete with more specific ones in downstream files. Anyone
who wants the convenience writes `open scoped TauCetiRoadmap.ProfiniteProPGroups`. -/
scoped instance normal_topologicalClosure {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (N : Subgroup G) [N.Normal] : N.topologicalClosure.Normal :=
  Subgroup.is_normal_topologicalClosure N

/-- One step of the **lower `p`-series**: `H ↦ closure (Hᵖ ⬝ [H, G])`, the topological
closure of the subgroup generated by the `p`-th powers from `H` and the commutators
`[H, G]`. -/
def pLowerCentralStep {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (H : Subgroup G) : Subgroup G :=
  (Subgroup.closure ((· ^ p) '' (H : Set G)) ⊔ ⁅H, (⊤ : Subgroup G)⁆).topologicalClosure

/-- The **lower `p`-series** (descending `p`-central series), 0-based to match Mathlib's
`lowerCentralSeries`: `λ₀ = G`, `λ_{k+1} = closure (λ_kᵖ [λ_k, G])`. Labute's `F_i`
(1-based) is `pLowerCentralSeries p F (i - 1)`; his `F₃` is our `λ₂`. -/
def pLowerCentralSeries (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    ℕ → Subgroup G
  | 0 => ⊤
  | k + 1 => pLowerCentralStep p (pLowerCentralSeries G k)

end Prototypes

/-! ### The class `C` of finite groups, as a structure

Not a loose predicate: the completion, the `C`-kernel, and the free pro-`C` group are all
defined from this data, and `finiteGroupClassP` instantiates it at finite `p`-groups. Closure
under finite products is a consequence of `mem_trivial` and `mem_extension`, so it is a
theorem rather than a field. -/

/-- A **class of finite groups** closed under isomorphism, subgroups, quotients, and
extensions: the data a pro-`C` completion needs. Universe-polymorphic in the groups it
speaks about; the resizing policy of `README.md` (transport a higher-universe finite group
through `Shrink`, which is harmless by `mem_congr`) is what relates the instantiations at
different universes. -/
structure FiniteGroupClass where
  /-- Membership of a finite group in the class. -/
  mem : ∀ (H : Type w) [Group H] [Finite H], Prop
  /-- Membership depends only on the isomorphism class. -/
  mem_congr : ∀ {H K : Type w} [Group H] [Finite H] [Group K] [Finite K],
    (H ≃* K) → (mem H ↔ mem K)
  /-- The trivial group is in the class. -/
  mem_trivial : mem PUnit
  /-- The class is closed under subgroups. -/
  mem_subgroup : ∀ {H : Type w} [Group H] [Finite H], mem H → ∀ K : Subgroup H, mem K
  /-- The class is closed under quotients. -/
  mem_quotient : ∀ {H : Type w} [Group H] [Finite H], mem H →
    ∀ (N : Subgroup H) [N.Normal], mem (H ⧸ N)
  /-- The class is closed under extensions. -/
  mem_extension : ∀ {H : Type w} [Group H] [Finite H] (N : Subgroup H) [N.Normal],
    mem N → mem (H ⧸ N) → mem H

/-- Finite `p`-groups, the instantiation everything in Layers 4–9 uses. -/
noncomputable def finiteGroupClassP (p : ℕ) : FiniteGroupClass.{u} where
  mem H := IsPGroup p H
  mem_congr := sorry
  mem_trivial := sorry
  mem_subgroup := sorry
  mem_quotient := sorry
  mem_extension := sorry

/-- The **`C`-kernel**: the intersection of the open normal subgroups whose quotient lies in
the class. `proCKernel (finiteGroupClassP p) G = proPKernel p G` is a Layer 4 milestone. -/
def proCKernel (C : FiniteGroupClass.{u}) (G : Type u) [Group G] [TopologicalSpace G] :
    Subgroup G :=
  ⨅ U : {U : OpenNormalSubgroup G //
    ∃ _ : Finite (G ⧸ U.toSubgroup), C.mem (G ⧸ U.toSubgroup)}, U.1.toSubgroup

instance proCKernel_normal (C : FiniteGroupClass.{u}) (G : Type u) [Group G]
    [TopologicalSpace G] : (proCKernel C G).Normal :=
  Subgroup.normal_iInf_normal fun U ↦ U.1.isNormal'

/-- **Pro-`C`, in quotient form**, the exact analogue of `IsProP` for a class `C`: each
continuous finite quotient lies in the class. `IsProP p` is the case `C = finiteGroupClassP p`,
by the Layer 4 comparison. This is the predicate the free pro-`C` universal property is stated
against; without it that universal property cannot say what its targets are. -/
def IsProC (C : FiniteGroupClass.{u}) (G : Type u) [Group G] [TopologicalSpace G] : Prop :=
  ∀ U : OpenNormalSubgroup G, ∃ _ : Finite (G ⧸ U.toSubgroup), C.mem (G ⧸ U.toSubgroup)


/-! ## Prototypes: free objects, presentations, and the dyadic instance -/

section FreeObjects

variable (p : ℕ)

/-- The **free profinite group** on `X`: the profinite completion of the discrete free group
(pinned construction; the universal property is what pins it down). -/
noncomputable abbrev freeProfiniteGroup (X : Type u) : ProfiniteGrp.{u} :=
  ProfiniteGrp.profiniteCompletion.obj (GrpCat.of (FreeGroup X))

/-- The generators of the free profinite group. -/
noncomputable def freeProfiniteGroup.of {X : Type u} (x : X) : freeProfiniteGroup X :=
  ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of (FreeGroup X)) (FreeGroup.of x)

/-- The **free pro-`C` group** on `X`: the `C`-completion of the free profinite group. -/
noncomputable abbrev freeProC (C : FiniteGroupClass.{u}) (X : Type u) : Type u :=
  freeProfiniteGroup X ⧸ proCKernel C (freeProfiniteGroup X)

/-- The generators of the free pro-`C` group. -/
noncomputable def freeProC.of {C : FiniteGroupClass.{u}} {X : Type u} (x : X) : freeProC C X :=
  QuotientGroup.mk (freeProfiniteGroup.of x)

/-- The **free pro-`p` group** on `X`: the maximal pro-`p` quotient of the free profinite
group (equivalently, the pro-`p` completion of the discrete free group). That this agrees
with `freeProC (finiteGroupClassP p) X` is a Layer 4 milestone, not a coincidence. -/
noncomputable abbrev freeProP (X : Type u) : Type u :=
  maximalProPQuotient p (freeProfiniteGroup X)

/-- The generators of the free pro-`p` group. -/
noncomputable def freeProP.of {X : Type u} (x : X) : freeProP p X :=
  QuotientGroup.mk (freeProfiniteGroup.of x)

/-- The profinite group **presented** by generators `X` and relators `rels`: the free
profinite group modulo the *closed* normal closure of the relators. This is the abstract
presentation object; it is distinct from `presentedProP` below, which first restricts to the
pro-`p` category. -/
noncomputable abbrev presentedProfiniteGroup (X : Type u)
    (rels : Set (freeProfiniteGroup X)) : Type u :=
  freeProfiniteGroup X ⧸ (Subgroup.normalClosure rels).topologicalClosure

/-- The canonical projection onto the presented profinite group. Named, because the universal
property below is a statement about factoring **through it**, and a nameless quotient map cannot
be the subject of one. -/
noncomputable def presentedProfiniteGroup.mk {X : Type u} (rels : Set (freeProfiniteGroup X)) :
    freeProfiniteGroup X →* presentedProfiniteGroup X rels :=
  QuotientGroup.mk' _

/-- The pro-`p` group **presented** by generators `X` and relators `rels`: the free pro-`p`
group modulo the *closed* normal closure of the relators (closedness is what keeps the
quotient profinite; the algebraic normal closure need not be closed). -/
noncomputable abbrev presentedProP (X : Type u) (rels : Set (freeProP p X)) : Type u :=
  freeProP p X ⧸ (Subgroup.normalClosure rels).topologicalClosure

/-- The canonical projection onto the presented pro-`p` group. -/
noncomputable def presentedProP.mk {X : Type u} (rels : Set (freeProP p X)) :
    freeProP p X →* presentedProP p X rels :=
  QuotientGroup.mk' _

/-- The dyadic Demushkin relator `A²S⁴(S,Y)` in the free pro-`2` group on `A, S, Y`
(`= of 0, of 1, of 2`), written out in Labute's commutator convention
`(x, y) = x⁻¹y⁻¹xy` (see the conventions in `README.md`). -/
noncomputable def d0Relator : freeProP 2 (Fin 3) :=
  freeProP.of 2 0 ^ 2 * freeProP.of 2 1 ^ 4 *
    ((freeProP.of 2 1)⁻¹ * (freeProP.of 2 2)⁻¹ * freeProP.of 2 1 * freeProP.of 2 2)

/-- **`D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y) = 1⟩`**, the standard rank-3, `q = 2` Demushkin group,
defined intrinsically as a presented pro-`2` group. -/
noncomputable abbrev demushkinD0 : Type := presentedProP 2 (Fin 3) {d0Relator}

/-- The **topological abelianization** `G^{ab} = G ⧸ closure [G,G]`, the profinite
abelianization when `G` is profinite and the home of the `q`-invariant. -/
abbrev topAbelianization (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] :
    Type u :=
  G ⧸ (commutator G).topologicalClosure

/-- `ℤ̂`, the profinite completion of `ℤ` (a stress-test object for Layers 0–2).
⚠ This is the profinite **group** only. The commutative ring structure on `ℤ̂`, the profinite
power `x ^ᶻ a` it makes sense of, and the `ℤ_ℓ` comparison of that power are owned by the
successor roadmap `ProfiniteArithmetic`, not by this one; no milestone here uses them. -/
noncomputable abbrev zHat : Type :=
  ProfiniteGrp.profiniteCompletion.obj (GrpCat.of (Multiplicative ℤ))

end FreeObjects

/-! ### The closed subgroups of `ℤ₂ˣ` (Layer 7)

Named forms for the three families of Labute's trichotomy. `U^(f) = 1 + 2^f ℤ₂` is the
kernel of reduction mod `2^f`; the convention `f = ∞`, meaning `{1}`, is the subgroup `⊥` and
is not a value of these `ℕ`-indexed definitions. -/

/-- `U^(f) = 1 + 2^f ℤ₂`, the principal unit subgroup of level `f`. -/
noncomputable def unitsPrincipal (f : ℕ) : Subgroup ℤ_[2]ˣ :=
  MonoidHom.ker (Units.map (PadicInt.toZModPow (p := 2) f).toMonoidHom)

/-- `{±1} × U^(f)`, the subgroup generated by `-1` together with `U^(f)`. At `f = ∞` this
degenerates to `{±1} = Subgroup.closure {-1}`, which the trichotomy lists separately. -/
noncomputable def unitsPlusMinus (f : ℕ) : Subgroup ℤ_[2]ˣ :=
  unitsPrincipal f ⊔ Subgroup.closure {(-1 : ℤ_[2]ˣ)}

/-- The closed subgroup topologically generated by a single unit. Labute's
`U^[f] = closure ⟨-1 + 2^f⟩` (`2 ≤ f < ∞`) is `procyclicClosure u` for the unit `u` with
`(u : ℤ_[2]) = -1 + 2 ^ f`; naming the generator rather than building it keeps the definition
free of an `IsUnit` side condition. -/
noncomputable def procyclicClosure (u : ℤ_[2]ˣ) : Subgroup ℤ_[2]ˣ :=
  (Subgroup.closure {u}).topologicalClosure

/-! ### Occurring as a continuous finite quotient (Layer 8)

Phrased through the kernel rather than through a topology on `Q`: a homomorphism to a finite
*discrete* group is continuous exactly when its kernel is open. That keeps the predicate
manifestly invariant under isomorphism of `Q` and lets the reconstruction theorem quantify
over bundled finite groups instead of over arbitrary topology-bearing types. -/

/-- `Q` occurs as a continuous finite quotient of `G`. -/
def IsFiniteContinuousQuotient (G : Type u) [Group G] [TopologicalSpace G]
    (Q : FiniteGrp.{v}) : Prop :=
  ∃ f : G →* Q, Function.Surjective f ∧ IsOpen ((f.ker : Subgroup G) : Set G)

/-! ## Layer 5: the coefficient objects, over the imported carrier

The cohomology is Mathlib's `continuousCohomology`. The Profinite Cohomology roadmap owns the
explicit low-degree descriptions, the comparison isomorphisms, the exact sequences, change of
groups, coinduction, Shapiro's lemma, corestriction and the cup products; this roadmap consumes
those declarations. What is fixed here is the coefficient object this roadmap computes with, the
trivial `𝔽_p`-representation, together with the multiplication pairing that gives its cup
square. -/

section Coefficients

/-- `ZMod p` carries the discrete topology, and so does its lift to a higher universe.
Mathlib's construction puts the coefficients in the universe of the group, so the trivial
module is `ULift (ZMod p)`. -/
scoped instance {p : ℕ} : TopologicalSpace (ZMod p) := ⊥

scoped instance {p : ℕ} : DiscreteTopology (ZMod p) := ⟨rfl⟩

scoped instance {p : ℕ} : TopologicalSpace (ULift.{u} (ZMod p)) := ⊥

scoped instance {p : ℕ} : DiscreteTopology (ULift.{u} (ZMod p)) := ⟨rfl⟩

scoped instance {p : ℕ} : ContinuousAdd (ULift.{u} (ZMod p)) :=
  ⟨continuous_of_discreteTopology⟩

scoped instance {p : ℕ} : ContinuousSMul (ZMod p) (ULift.{u} (ZMod p)) :=
  ⟨continuous_of_discreteTopology⟩

/-- The trivial `G`-representation on `𝔽_p`, as an object of the category `TopRep (ZMod p) G`
that the imported cohomology is a functor out of. -/
noncomputable def trivialFp (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] : ProfiniteCohomology.TopRep (ZMod p) G :=
  TopRep.of (ContRepresentation.trivial (ZMod p) G (ULift.{u} (ZMod p)))

/-- **`Hⁿ(G, 𝔽_p)`**, against the imported carrier. Every dimension count below is about this
object. -/
noncomputable abbrev cohomFp (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (n : ℕ) : TopModuleCat.{u} (ZMod p) :=
  _root_.continuousCohomology n (trivialFp p G)

/-- **The multiplication pairing on `𝔽_p`**, as a `TopPairing` of the trivial representation
with itself. This is the coefficient input of the imported cup product: `cup (fpPairing p G) 1 1`
is the cup square `H¹(G, 𝔽_p) × H¹(G, 𝔽_p) → H²(G, 𝔽_p)` that the Demushkin predicate is
stated against, and there is no second cup product in this roadmap.
The pairing is the multiplication of `ZMod p`, which is `ZMod p`-bilinear, continuous because the
coefficients are discrete, and equivariant because the action is trivial. -/
noncomputable def fpPairing (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] :
    ProfiniteCohomology.TopPairing (trivialFp p G) (trivialFp p G) (trivialFp p G) where
  bil := sorry
  cont := sorry
  equivariant := sorry

/-- **Layer 5, the pairing is multiplication.** The defining equation of `fpPairing`, without
which the pairing would be an arbitrary bilinear map and every nondegeneracy statement below
would be vacuous. -/
theorem fpPairing_bil (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (a b : ULift.{u} (ZMod p)) :
    (fpPairing p G).bil a b = ULift.up (a.down * b.down) :=
  sorry

/-- **Layer 5, the cup square on `H¹(G, 𝔽_p)`.** The bidegree-`(1,1)` product of the imported
cup at the pairing above, with the degree `1 + 1` rewritten as `2`. Every nondegeneracy clause
below is stated against this abbreviation, so all of them are about one operation. -/
noncomputable abbrev cupFp (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (a b : cohomFp p G 1) : cohomFp p G 2 :=
  ProfiniteCohomology.degreeCast (by norm_num) (trivialFp p G)
    (ProfiniteCohomology.cup (fpPairing p G) 1 1 a b)

/-- **Layer 5, graded commutativity of the cup square**, the specialization of the imported
`cup_gradedComm` to `fpPairing`, whose opposite pairing is itself because multiplication in
`ZMod p` is commutative. With it, right nondegeneracy of a cup pairing follows from left
nondegeneracy, so the second nondegeneracy clause of `IsDemushkin` becomes a theorem and is
dropped. -/
theorem cupFp_gradedComm (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (a b : cohomFp p G 1) : cupFp p G a b = - cupFp p G b a :=
  sorry

end Coefficients


/-! ### Twisted coefficients, and the prescription property

The coefficients `I(χ)/p^i` are `ZMod (p ^ i)` with `G` acting through `χ`. The cocycle and
coboundary conditions for that action are written out here, rather than through a second
module structure on `ZMod (p ^ i)`, so that no instance has to be installed on a Mathlib type
and no statement below depends on one. -/

section Prescription

variable {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]

/-- The scalar by which `g` acts on `I(χ)/p^i`. -/
noncomputable def charScalar (χ : G →* ℤ_[p]ˣ) (i : ℕ) (g : G) : ZMod (p ^ i) :=
  PadicInt.toZModPow i ((χ g : ℤ_[p]ˣ) : ℤ_[p])

/-- The scalar by which `g` acts on `I(χ)/p`. -/
noncomputable def charScalarBase (χ : G →* ℤ_[p]ˣ) (g : G) : ZMod p :=
  PadicInt.toZMod ((χ g : ℤ_[p]ˣ) : ℤ_[p])

/-- A continuous crossed homomorphism with values in `I(χ)/p^i`. -/
def IsCharCocycle (χ : G →* ℤ_[p]ˣ) (i : ℕ) (f : LocallyConstant G (ZMod (p ^ i))) : Prop :=
  ∀ g h : G, f (g * h) = charScalar χ i g * f h + f g

/-- A continuous crossed homomorphism with values in `I(χ)/p`. -/
def IsCharCocycleBase (χ : G →* ℤ_[p]ˣ) (f : LocallyConstant G (ZMod p)) : Prop :=
  ∀ g h : G, f (g * h) = charScalarBase χ g * f h + f g

/-- A principal crossed homomorphism with values in `I(χ)/p`. -/
def IsCharCoboundaryBase (χ : G →* ℤ_[p]ˣ) (f : LocallyConstant G (ZMod p)) : Prop :=
  ∃ m : ZMod p, ∀ g : G, f g = charScalarBase χ g * m - m

/-- **The prescription property, in lifting form** (condition 1 of the conventions). Every
continuous crossed homomorphism with values in `I(χ)/p` is, modulo principal ones, the
reduction of a continuous crossed homomorphism with values in `I(χ)/p^i`. This says exactly
that `H¹(G, I(χ)/p^i) → H¹(G, I(χ)/p)` is surjective for every `i ≥ 1`. It is the property
that pins Serre's canonical character: a Demushkin group has exactly one continuous `χ` with
it (Labute Thm 4). -/
def HasPrescriptionProperty (χ : G →* ℤ_[p]ˣ) : Prop :=
  ∀ i : ℕ, ∀ hi : 1 ≤ i, ∀ c : LocallyConstant G (ZMod p), IsCharCocycleBase χ c →
    ∃ c' : LocallyConstant G (ZMod (p ^ i)), IsCharCocycle χ i c' ∧
      IsCharCoboundaryBase χ
        (LocallyConstant.map (ZMod.castHom (dvd_pow_self p (by omega : i ≠ 0)) (ZMod p)) c'
          - c)

end Prescription

/-! ## Layer 7: the Demushkin predicate, its rank, and its invariants

These declarations were pseudocode while the cohomology had no carrier. They are statements
now, against the Layer 5 carrier. -/

section Demushkin

variable (p : ℕ) [Fact p.Prime]
variable (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
  [TotallyDisconnectedSpace G]

/-- **The Demushkin predicate** (Labute p. 106). The pro-`p` hypothesis is a field, so that
no downstream theorem applies to a group that satisfies only the cohomological clauses. Both
nondegeneracy clauses are fields; if the cup product is proved graded-commutative in this
bidegree, the second becomes a theorem and the field is dropped. Nondegeneracy is stated
through `cupFp`, which is the imported cup product at the multiplication pairing on `𝔽_p`.
Finite generation is derived from `h1_fin` and the Burnside basis theorem, and is never
assumed. -/
structure IsDemushkin : Prop where
  /-- `G` is a pro-`p` group. -/
  proP : IsProP p G
  /-- `H¹(G, 𝔽_p)` is finite-dimensional, against the imported carrier. -/
  h1_fin : Module.Finite (ZMod p) (cohomFp p G 1)
  /-- `H²(G, 𝔽_p)` is one-dimensional, against the imported carrier. -/
  h2_rank : Module.finrank (ZMod p) (cohomFp p G 2) = 1
  /-- The cup pairing is nondegenerate on the left. -/
  cupLeft : ∀ a : cohomFp p G 1, a ≠ 0 → ∃ b : cohomFp p G 1, cupFp p G a b ≠ 0
  /-- The cup pairing is nondegenerate on the right. -/
  cupRight : ∀ b : cohomFp p G 1, b ≠ 0 → ∃ a : cohomFp p G 1, cupFp p G a b ≠ 0

/-- **Layer 7, a Demushkin group is topologically finitely generated.** From `h1_fin`, the
`H¹` interpretation of Layer 5, and the Burnside basis theorem of Layer 3. -/
theorem IsDemushkin.isTopologicallyFinitelyGenerated {p G} [Fact p.Prime] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (_hG : IsDemushkin p G) : IsTopologicallyFinitelyGenerated G :=
  sorry

/-- **The rank of a Demushkin group**, as a natural number. Every numerical statement about
Demushkin groups is about this accessor, and never about an unqualified rank. -/
noncomputable def demushkinRank {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) : ℕ :=
  topologicalGeneratorRankNat G hG.isTopologicallyFinitelyGenerated

open scoped Classical in
/-- **Labute's `q`-invariant.** It is `0` when the topological abelianization is
torsion-free, which is Labute's `q = p^∞` convention, and the number of torsion elements
otherwise. For a Demushkin group the torsion subgroup is finite and cyclic by Layer 7, so
this is the `q` of `G^{ab} ≅ ℤ_p^{n-1} × ℤ/q`. `Nat.card` is `0` on an infinite type, so no
finiteness hypothesis is needed to make the definition total; the Layer 7 theorem is what
makes it correct. -/
noncomputable def demushkinQ {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (_hG : IsDemushkin p G) : ℕ :=
  if ∀ x : topAbelianization G, IsOfFinOrder x → x = 1 then 0
  else Nat.card {x : topAbelianization G // IsOfFinOrder x}

/-- **Layer 7, the `q`-invariant is an isomorphism invariant.** -/
example {p G H} [Fact p.Prime] [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] [Group H] [TopologicalSpace H]
    [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : IsDemushkin p G) (hH : IsDemushkin p H) (_e : G ≃ₜ* H) :
    demushkinQ hG = demushkinQ hH :=
  sorry

/-- **Layer 7, the canonical character exists and is unique.** The prescription property is
stated in the lifting form: every continuous cocycle with values in `ℤ/p`, twisted by `χ`,
lifts modulo coboundaries to one with values in `ℤ/p^i`. The theorem is that a Demushkin group
has exactly one continuous `χ` with that property (Serre; Labute Thm 4). -/
theorem existsUnique_hasPrescriptionProperty {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (_hG : IsDemushkin p G) :
    ∃! χ : G →* ℤ_[p]ˣ, Continuous χ ∧ HasPrescriptionProperty χ :=
  sorry

/-- **The canonical character (orientation) of a Demushkin group**, the unique continuous
`χ : G → ℤ_pˣ` with the prescription property. It is data, so it is a `def`; the three theorems
below are what pin it, and every statement about the orientation is about this declaration. -/
noncomputable def demushkinCharacter {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) : G →* ℤ_[p]ˣ :=
  (existsUnique_hasPrescriptionProperty hG).exists.choose

/-- **Layer 7, the canonical character is continuous.** -/
theorem demushkinCharacter_continuous {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) : Continuous (demushkinCharacter hG) :=
  (existsUnique_hasPrescriptionProperty hG).exists.choose_spec.1

/-- **Layer 7, the canonical character has the prescription property.** -/
theorem demushkinCharacter_hasPrescriptionProperty {p G} [Fact p.Prime] [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) : HasPrescriptionProperty (demushkinCharacter hG) :=
  (existsUnique_hasPrescriptionProperty hG).exists.choose_spec.2

/-- **Layer 7, the canonical character is the only one.** This is the uniqueness half of
Labute Thm 4 and the abstract normalization exported to downstream applications. -/
theorem demushkinCharacter_unique {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) (χ : G →* ℤ_[p]ˣ) (hcont : Continuous χ)
    (hpres : HasPrescriptionProperty χ) : χ = demushkinCharacter hG :=
  (existsUnique_hasPrescriptionProperty hG).unique ⟨hcont, hpres⟩
    (existsUnique_hasPrescriptionProperty hG).exists.choose_spec

/-- **Layer 7, the orientation image is a closed subgroup**, and it is the invariant that the
`q = 2` classification uses in place of `q`. -/
theorem demushkinCharacter_range_isClosed {p G} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) : IsClosed (((demushkinCharacter hG).range : Subgroup ℤ_[p]ˣ) :
      Set ℤ_[p]ˣ) :=
  sorry

/-- **Layer 7, the orientation image is an isomorphism invariant.** The transport lemma the
acceptance instances use. -/
theorem demushkinCharacter_range_congr {p G H} [Fact p.Prime] [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] [Group H]
    [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : IsDemushkin p G) (hH : IsDemushkin p H) (_e : G ≃ₜ* H) :
    (demushkinCharacter hG).range = (demushkinCharacter hH).range :=
  sorry

end Demushkin

/-! ## Layer 8: the graded pieces of the lower `p`-series

`gr_k(G)` is a profinite `𝔽_p`-vector space in general, and finite only under topological
finite generation. It is written additively, so the carrier is `Additive` of the group
quotient. The bracket, the `p`-power operator and the dyadic failure of additivity are the
objects that Layers 8 and 9 compute with, and they are named maps here rather than existence
statements, because the classification computes with their laws. -/

section Graded

open scoped commutatorElement

variable (p : ℕ) [Fact p.Prime] (G : Type u) [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]

-- Normality of `λ_{k+1}` inside `λ_k` is itself a Layer 8 milestone, so it is an instance
-- argument for the whole section: without it the quotient carries no group structure and none
-- of the operations below can be typed.
variable [hnormal : ∀ k : ℕ,
  ((pLowerCentralSeries p G (k + 1)).subgroupOf (pLowerCentralSeries p G k)).Normal]

include hnormal

/-- **`gr_k(G) = λ_k / λ_{k+1}`**, the `k`-th graded piece of the lower `p`-series, written
additively as `README.md` Layer 8 does. It is an elementary abelian pro-`p` group, and it is a
`ZMod p`-module by a Layer 8 milestone. It is **not** finite in general. -/
abbrev gradedPiece (k : ℕ) : Type u :=
  Additive (pLowerCentralSeries p G k ⧸
    ((pLowerCentralSeries p G (k + 1)).subgroupOf (pLowerCentralSeries p G k)))

/-- The class in `gr_k(G)` of an element of `λ_k`. -/
def gradedMk (k : ℕ) (x : pLowerCentralSeries p G k) : gradedPiece p G k :=
  Additive.ofMul (QuotientGroup.mk x)

/-- **Layer 8, transport along an equality of degrees.** The bracket and the `p`-power operator
compose into different but equal degree expressions, so the Jacobi identity and the two
`π`-bracket identities are stated through this map. -/
def gradedCast {j k : ℕ} (h : j = k) : gradedPiece p G j → gradedPiece p G k := fun x => h ▸ x

/-- **Layer 8, the graded pieces are elementary abelian.** Every element is killed by `p`,
which is what makes `gradedPiece` an `𝔽_p`-vector space. -/
theorem nsmul_gradedPiece_eq_zero (k : ℕ) (hG : IsProP p G) (x : gradedPiece p G k) :
    p • x = 0 :=
  sorry

/-- **Layer 8, finiteness is conditional.** Under topological finite generation every
`λ_{k+1}` is open, so each graded piece is finite. Without that hypothesis the statement is
false: `∏_I C_p` with `I` infinite has `λ_1 = ⊥` and `gr_0 = G`. There is no unconditional
global `Finite` instance. -/
theorem finite_gradedPiece (k : ℕ) (hG : IsProP p G)
    (hfg : IsTopologicallyFinitelyGenerated G) : Finite (gradedPiece p G k) :=
  sorry

/-- **Layer 8, commutators raise the degree.** The membership statement that makes the bracket
below well defined, and the one every explicit computation in Layer 9 cites. -/
theorem commutator_mem_pLowerCentralSeries (j k : ℕ) {x y : G}
    (hx : x ∈ pLowerCentralSeries p G j) (hy : y ∈ pLowerCentralSeries p G k) :
    ⁅x, y⁆ ∈ pLowerCentralSeries p G (j + k + 1) :=
  sorry

/-- **Layer 8, `p`-th powers raise the degree.** The membership statement that makes the
`p`-power operator below well defined. -/
theorem pow_mem_pLowerCentralSeries (k : ℕ) {x : G} (hx : x ∈ pLowerCentralSeries p G k) :
    x ^ p ∈ pLowerCentralSeries p G (k + 1) :=
  sorry

/-- **Layer 8, the bracket** `[·,·] : gr_j × gr_k → gr_{j+k+1}`, induced by the group
commutator. The degree shifts by one because the series is 0-based. -/
def gradedBracket (j k : ℕ) :
    gradedPiece p G j → gradedPiece p G k → gradedPiece p G (j + k + 1) :=
  sorry

/-- **Layer 8, the `p`-power operator** `π : gr_k → gr_{k+1}`, induced by `x ↦ x ^ p`. -/
def gradedPow (k : ℕ) : gradedPiece p G k → gradedPiece p G (k + 1) :=
  sorry

/-- **Layer 8, the bracket on classes.** The defining equation: without it `gradedBracket`
would be an arbitrary map. -/
theorem gradedBracket_mk (j k : ℕ) (x : pLowerCentralSeries p G j)
    (y : pLowerCentralSeries p G k) :
    gradedBracket p G j k (gradedMk p G j x) (gradedMk p G k y)
      = gradedMk p G (j + k + 1)
        ⟨⁅(x : G), (y : G)⁆, commutator_mem_pLowerCentralSeries p G j k x.2 y.2⟩ :=
  sorry

/-- **Layer 8, the `p`-power operator on classes.** The defining equation for `gradedPow`. -/
theorem gradedPow_mk (k : ℕ) (x : pLowerCentralSeries p G k) :
    gradedPow p G k (gradedMk p G k x)
      = gradedMk p G (k + 1) ⟨(x : G) ^ p, pow_mem_pLowerCentralSeries p G k x.2⟩ :=
  sorry

/-- **Layer 8, the bracket is bilinear.** Additivity in each argument; since every graded piece
is killed by `p`, additivity over `ℤ` is `𝔽_p`-bilinearity. -/
theorem gradedBracket_bilinear (j k : ℕ) (x x' : gradedPiece p G j) (y y' : gradedPiece p G k) :
    gradedBracket p G j k (x + x') y = gradedBracket p G j k x y + gradedBracket p G j k x' y ∧
      gradedBracket p G j k x (y + y')
        = gradedBracket p G j k x y + gradedBracket p G j k x y' :=
  sorry

/-- **Layer 8, the bracket is alternating.** `[x, x] = 0` in every degree, in every
characteristic; skew-symmetry follows by expanding `[x + y, x + y]`. -/
theorem gradedBracket_alternating (k : ℕ) (x : gradedPiece p G k) :
    gradedBracket p G k k x x = 0 :=
  sorry

/-- **Layer 8, the Jacobi identity**, with the three terms transported into the single degree
`i + j + k + 2`. -/
theorem gradedBracket_jacobi (i j k : ℕ) (x : gradedPiece p G i) (y : gradedPiece p G j)
    (z : gradedPiece p G k) :
    gradedCast p G (by omega)
        (gradedBracket p G (i + j + 1) k (gradedBracket p G i j x y) z)
      + gradedCast p G (by omega)
        (gradedBracket p G (j + k + 1) i (gradedBracket p G j k y z) x)
      + gradedCast p G (by omega)
        (gradedBracket p G (k + i + 1) j (gradedBracket p G k i z x) y)
      = (0 : gradedPiece p G (i + j + k + 2)) :=
  sorry

end Graded

section GradedFunctoriality

variable (p : ℕ) [Fact p.Prime] (G : Type u) [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
  (H : Type u) [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H]
  [TotallyDisconnectedSpace H]

variable [hnormalG : ∀ k : ℕ,
    ((pLowerCentralSeries p G (k + 1)).subgroupOf (pLowerCentralSeries p G k)).Normal]
  [hnormalH : ∀ k : ℕ,
    ((pLowerCentralSeries p H (k + 1)).subgroupOf (pLowerCentralSeries p H k)).Normal]

include hnormalG hnormalH

/-- **Layer 8, the graded map of a continuous homomorphism.** It exists because `f` respects
the lower `p`-series, which is the functoriality milestone of this layer. -/
def gradedMap (f : G →* H) (hf : Continuous f) (k : ℕ) :
    gradedPiece p G k → gradedPiece p H k :=
  sorry

/-- **Layer 8, the graded map on classes.** -/
theorem gradedMap_mk (f : G →* H) (hf : Continuous f) (k : ℕ) (x : pLowerCentralSeries p G k)
    (hx : f (x : G) ∈ pLowerCentralSeries p H k) :
    gradedMap p G H f hf k (gradedMk p G k x) = gradedMk p H k ⟨f (x : G), hx⟩ :=
  sorry

/-- **Layer 8, naturality of the bracket.** -/
theorem gradedBracket_natural (f : G →* H) (hf : Continuous f) (j k : ℕ)
    (x : gradedPiece p G j) (y : gradedPiece p G k) :
    gradedMap p G H f hf (j + k + 1) (gradedBracket p G j k x y)
      = gradedBracket p H j k (gradedMap p G H f hf j x) (gradedMap p G H f hf k y) :=
  sorry

/-- **Layer 8, naturality of the `p`-power operator.** -/
theorem gradedPow_natural (f : G →* H) (hf : Continuous f) (k : ℕ) (x : gradedPiece p G k) :
    gradedMap p G H f hf (k + 1) (gradedPow p G k x)
      = gradedPow p H k (gradedMap p G H f hf k x) :=
  sorry

end GradedFunctoriality

section GradedPowerLaws

variable (p : ℕ) [Fact p.Prime] (G : Type u) [Group G] [TopologicalSpace G]
  [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]

variable [hnormal : ∀ k : ℕ,
  ((pLowerCentralSeries p G (k + 1)).subgroupOf (pLowerCentralSeries p G k)).Normal]

include hnormal

/-- **Layer 8, `π` is additive above degree zero**, for every `p`. The Hall-Petrescu
corrections have degrees above `k + 1` once `k ≥ 1`. -/
theorem gradedPow_add_of_pos (k : ℕ) (hk : 1 ≤ k) (x y : gradedPiece p G k) :
    gradedPow p G k (x + y) = gradedPow p G k x + gradedPow p G k y :=
  sorry

/-- **Layer 8, `π` is additive in every degree for odd `p`**, because the Hall-Petrescu
coefficients `binom(p, i)` are divisible by `p` and the degree-zero corrections vanish too. -/
theorem gradedPow_add_of_odd (hp : Odd p) (k : ℕ) (x y : gradedPiece p G k) :
    gradedPow p G k (x + y) = gradedPow p G k x + gradedPow p G k y :=
  sorry

/-- **Layer 8, the dyadic failure of additivity.** At `p = 2` and in degree zero, `π` is not
additive, and the defect is exactly the bracket:
`π (x + y) = π x + π y + [x, y]` in `gr_1(G)`. This is the `binom(2, 2)` term of the
Hall-Petrescu expansion, and it is the identity that shapes every `q = 2` argument of
Layer 9. -/
theorem gradedPow_add_zero_dyadic (hp : p = 2) (x y : gradedPiece p G 0) :
    gradedPow p G 0 (x + y)
      = gradedPow p G 0 x + gradedPow p G 0 y + gradedBracket p G 0 0 x y :=
  sorry

/-- **Layer 8, the failure is not vacuous.** In the free pro-`2` group of rank `2` the bracket
of the two basis classes is nonzero in `gr_1`, so `π` really is not additive on `gr_0`. -/
theorem gradedBracket_freeProP_two_ne_zero
    [∀ k : ℕ, ((pLowerCentralSeries 2 (freeProP 2 (Fin 2)) (k + 1)).subgroupOf
      (pLowerCentralSeries 2 (freeProP 2 (Fin 2)) k)).Normal]
    [CompactSpace (freeProP 2 (Fin 2))] [TotallyDisconnectedSpace (freeProP 2 (Fin 2))]
    (x y : gradedPiece 2 (freeProP 2 (Fin 2)) 0)
    (hx : x = gradedMk 2 _ 0 ⟨freeProP.of 2 0, by simp [pLowerCentralSeries]⟩)
    (hy : y = gradedMk 2 _ 0 ⟨freeProP.of 2 1, by simp [pLowerCentralSeries]⟩) :
    gradedBracket 2 (freeProP 2 (Fin 2)) 0 0 x y ≠ 0 :=
  sorry

/-- **Layer 8, `π` against the bracket on the left**, away from degree zero: `π[x, y] = [πx, y]`
for `x ∈ gr_j` and `y ∈ gr_k` with `j, k ≥ 1`. The correction term `[[x, y], x]` has degree
`2j + k + 2`, so it vanishes in `gr_{j+k+2}` unless `j = 0`. -/
theorem gradedPow_bracket_left (j k : ℕ) (hj : 1 ≤ j) (hk : 1 ≤ k) (x : gradedPiece p G j)
    (y : gradedPiece p G k) :
    gradedPow p G (j + k + 1) (gradedBracket p G j k x y)
      = gradedCast p G (by omega)
        (gradedBracket p G (j + 1) k (gradedPow p G j x) y) :=
  sorry

/-- **Layer 8, `π` against the bracket on the right**: `π[x, y] = [x, πy]` under the same
degree hypotheses. -/
theorem gradedPow_bracket_right (j k : ℕ) (hj : 1 ≤ j) (hk : 1 ≤ k) (x : gradedPiece p G j)
    (y : gradedPiece p G k) :
    gradedPow p G (j + k + 1) (gradedBracket p G j k x y)
      = gradedCast p G (by omega)
        (gradedBracket p G j (k + 1) x (gradedPow p G k y)) :=
  sorry

end GradedPowerLaws

/-! ## Layer 9 prerequisites: the completed group algebra, in both shapes

The orientation image `Γ = Im χ` is procyclic in one branch and `C₂ × ℤ₂` in the other. Both
shapes are needed, and the second is one of the two even-rank families at `q = 2`. -/

/-- **The completed group algebra** `Λ = ℤ_p[[Γ]] = lim_U ℤ_p[Γ/U]`, the inverse limit over the
open normal subgroups of a profinite group `Γ`, with the inverse-limit topology. The index set
is the open *normal* subgroups, because `Γ/U` has to be a group for `ℤ_p[Γ/U]` to be a group
algebra. -/
def completedGroupAlgebra (p : ℕ) (Γ : Type u) [Group Γ] [TopologicalSpace Γ] : Type u :=
  sorry

section CompletedAlgebra

variable (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ]

noncomputable instance : Ring (completedGroupAlgebra p Γ) := sorry

noncomputable instance : Algebra ℤ_[p] (completedGroupAlgebra p Γ) := sorry

instance : TopologicalSpace (completedGroupAlgebra p Γ) := sorry

instance : IsTopologicalRing (completedGroupAlgebra p Γ) := sorry

instance : CompactSpace (completedGroupAlgebra p Γ) := sorry

instance : TotallyDisconnectedSpace (completedGroupAlgebra p Γ) := sorry

/-- **Layer 9, commutativity is not automatic.** `Λ` is commutative exactly when `Γ` is
abelian, which is the case in every use below, since `Γ = Im χ ≤ ℤ_pˣ`. Stated as an equation
rather than as a `CommRing` instance, so that no second ring structure is installed on `Λ`. -/
theorem completedGroupAlgebra_mul_comm (hΓ : ∀ x y : Γ, x * y = y * x)
    (a b : completedGroupAlgebra p Γ) : a * b = b * a :=
  sorry

/-- **Layer 9, the group elements inside `Λ`.** -/
noncomputable def completedGroupAlgebra.of : Γ →* (completedGroupAlgebra p Γ)ˣ :=
  sorry

/-- The image of a group element in `Λ`, as a ring element. -/
noncomputable abbrev completedGroupAlgebra.ofVal (γ : Γ) : completedGroupAlgebra p Γ :=
  ((completedGroupAlgebra.of p Γ γ : (completedGroupAlgebra p Γ)ˣ) : completedGroupAlgebra p Γ)

/-- **Layer 9, `of` is continuous**, so that a topological generator of `Γ` gives a
power-series coordinate below. -/
theorem completedGroupAlgebra.of_continuous :
    Continuous (completedGroupAlgebra.ofVal p Γ) :=
  sorry

/-- **Layer 9, the finite-level projection.** The target is pinned to the group algebra of the
finite quotient `Γ/U`: this is what makes `Λ` the inverse limit and not an abstract ring. -/
noncomputable def completedGroupAlgebra.proj (U : OpenNormalSubgroup Γ) :
    completedGroupAlgebra p Γ →+* MonoidAlgebra ℤ_[p] (Γ ⧸ U.toSubgroup) :=
  sorry

/-- **Layer 9, the projections are surjective**, which with separatedness is the inverse-limit
description. -/
theorem completedGroupAlgebra.proj_surjective (U : OpenNormalSubgroup Γ) :
    Function.Surjective (completedGroupAlgebra.proj p Γ U) :=
  sorry

/-- **Layer 9, `Λ` is separated**: an element killed by every finite-level projection is `0`. -/
theorem completedGroupAlgebra.eq_zero_of_proj_eq_zero (x : completedGroupAlgebra p Γ)
    (h : ∀ U : OpenNormalSubgroup Γ, completedGroupAlgebra.proj p Γ U x = 0) : x = 0 :=
  sorry

/-- **Layer 9, the projection of a group element** is its class in the finite group algebra. -/
theorem completedGroupAlgebra.proj_of (U : OpenNormalSubgroup Γ) (γ : Γ) :
    completedGroupAlgebra.proj p Γ U (completedGroupAlgebra.ofVal p Γ γ)
      = MonoidAlgebra.single (QuotientGroup.mk γ) 1 :=
  sorry

end CompletedAlgebra

section CompletedAlgebraFunctoriality

variable (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ]
  (Δ : Type u) [Group Δ] [TopologicalSpace Δ]

/-- **Layer 9, functoriality of `Λ`.** -/
noncomputable def completedGroupAlgebra.map (f : Γ →* Δ) (hf : Continuous f) :
    completedGroupAlgebra p Γ →+* completedGroupAlgebra p Δ :=
  sorry

/-- **Layer 9, `map` on group elements.** -/
theorem completedGroupAlgebra.map_of (f : Γ →* Δ) (hf : Continuous f) (γ : Γ) :
    completedGroupAlgebra.map p Γ Δ f hf (completedGroupAlgebra.ofVal p Γ γ)
      = completedGroupAlgebra.ofVal p Δ (f γ) :=
  sorry

/-- **Layer 9, `map` of a continuous surjection is surjective.** -/
theorem completedGroupAlgebra.map_surjective (f : Γ →* Δ) (hf : Continuous f)
    (hsurj : Function.Surjective f) :
    Function.Surjective (completedGroupAlgebra.map p Γ Δ f hf) :=
  sorry

end CompletedAlgebraFunctoriality

section CompletedAlgebraLaws

variable (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ]

/-- **Layer 9, the identity law of `Λ`.** -/
theorem completedGroupAlgebra.map_id :
    completedGroupAlgebra.map p Γ Γ (MonoidHom.id Γ) continuous_id
      = RingHom.id (completedGroupAlgebra p Γ) :=
  sorry

/-- **Layer 9, the composition law of `Λ`.** -/
theorem completedGroupAlgebra.map_comp (Δ : Type u) [Group Δ] [TopologicalSpace Δ]
    (E : Type u) [Group E] [TopologicalSpace E] (f : Γ →* Δ) (hf : Continuous f) (g : Δ →* E)
    (hg : Continuous g) :
    completedGroupAlgebra.map p Γ E (g.comp f) (hg.comp hf)
      = (completedGroupAlgebra.map p Δ E g hg).comp
        (completedGroupAlgebra.map p Γ Δ f hf) :=
  sorry

end CompletedAlgebraLaws

/-! ### The procyclic coordinate, evaluation and division

These are the three statements Labute's §4 arguments run on: the power-series coordinate, the
evaluation homomorphism at a point of the maximal ideal, and the division criterion that
produces the basis corrections of Layer 9. -/

section PowerSeriesCoordinate

variable (p : ℕ) [Fact p.Prime]

/-- **Layer 9, evaluation of a power series at a point of the maximal ideal.** For
`v_p(c) ≥ 1` the series `ψ(c)` converges in `ℤ_p`; the convergence hypothesis is carried in
every statement. -/
noncomputable def powerSeriesEval (ψ : PowerSeries ℤ_[p]) (c : ℤ_[p]) (hc : (p : ℤ_[p]) ∣ c) :
    ℤ_[p] :=
  sorry

/-- **Layer 9, evaluation is an algebra homomorphism**, in the two equations that the
annihilator computation uses. -/
theorem powerSeriesEval_add_mul (ψ φ : PowerSeries ℤ_[p]) (c : ℤ_[p]) (hc : (p : ℤ_[p]) ∣ c) :
    powerSeriesEval p (ψ + φ) c hc = powerSeriesEval p ψ c hc + powerSeriesEval p φ c hc ∧
      powerSeriesEval p (ψ * φ) c hc
        = powerSeriesEval p ψ c hc * powerSeriesEval p φ c hc :=
  sorry

/-- **Layer 9, the defining values of evaluation**: `X ↦ c` and a constant to itself. Without
them `powerSeriesEval` would be an arbitrary map and the division criterion would say nothing. -/
theorem powerSeriesEval_X_C (c : ℤ_[p]) (hc : (p : ℤ_[p]) ∣ c) (a : ℤ_[p]) :
    powerSeriesEval p PowerSeries.X c hc = c ∧
      powerSeriesEval p (PowerSeries.C (R := ℤ_[p]) a) c hc = a :=
  sorry

/-- **Layer 9, the division criterion** `(T - c) ∣ ψ ↔ ψ(c) = 0`, for `v_p(c) ≥ 1`, in both
directions and with the quotient given by the explicit series. This is the special case of
Weierstrass division that Labute uses on p. 122; the general Weierstrass preparation theorem
is not a target. It is the step that produces the basis correction of Layer 9. -/
theorem powerSeries_sub_C_dvd_iff (ψ : PowerSeries ℤ_[p]) (c : ℤ_[p]) (hc : (p : ℤ_[p]) ∣ c) :
    (PowerSeries.X - PowerSeries.C (R := ℤ_[p]) c) ∣ ψ ↔ powerSeriesEval p ψ c hc = 0 :=
  sorry

end PowerSeriesCoordinate

section ProcyclicCoordinate

variable (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ]
  [IsTopologicalGroup Γ]

/-- **Layer 9, the procyclic coordinate.** For `Γ ≅ ℤ_p` with topological generator `γ`, the
assignment `T ↦ γ - 1` extends to an isomorphism of topological `ℤ_p`-algebras
`ℤ_p[[T]] ≅ ℤ_p[[Γ]]`. The direction is from the power-series ring to the completed algebra,
because that is the direction in which the coordinate is chosen. -/
noncomputable def completedGroupAlgebra.powerSeriesCoordinate (γ : Γ)
    (hγ : (Subgroup.closure ({γ} : Set Γ)).topologicalClosure = ⊤)
    (hfree : Nonempty (Γ ≃ₜ* Multiplicative ℤ_[p])) :
    PowerSeries ℤ_[p] ≃ₐ[ℤ_[p]] completedGroupAlgebra p Γ :=
  sorry

/-- **Layer 9, the coordinate matches the two filtrations.** `PowerSeries` carries no topology
at the pin, so the topological half of the coordinate is stated as the identification of the
`X`-adic filtration with the kernels of the finite-level projections, which is exactly what the
inverse-limit topology on `Λ` is. -/
theorem completedGroupAlgebra.powerSeriesCoordinate_filtration (γ : Γ)
    (hγ : (Subgroup.closure ({γ} : Set Γ)).topologicalClosure = ⊤)
    (hfree : Nonempty (Γ ≃ₜ* Multiplicative ℤ_[p])) (k : ℕ) :
    ∃ U : OpenNormalSubgroup Γ,
      {x : completedGroupAlgebra p Γ | completedGroupAlgebra.proj p Γ U x = 0}
        = completedGroupAlgebra.powerSeriesCoordinate p Γ γ hγ hfree ''
          {ψ : PowerSeries ℤ_[p] | PowerSeries.X ^ k ∣ ψ} :=
  sorry

/-- **Layer 9, the defining value of the coordinate**: `T ↦ γ - 1`. -/
theorem completedGroupAlgebra.powerSeriesCoordinate_X (γ : Γ)
    (hγ : (Subgroup.closure ({γ} : Set Γ)).topologicalClosure = ⊤)
    (hfree : Nonempty (Γ ≃ₜ* Multiplicative ℤ_[p])) :
    completedGroupAlgebra.powerSeriesCoordinate p Γ γ hγ hfree PowerSeries.X
      = completedGroupAlgebra.ofVal p Γ γ - 1 :=
  sorry

/-- **Layer 9, the dependence on the generator.** Replacing `γ` by `γ^u` with `u ∈ ℤ_pˣ`
changes the coordinate by the substitution `T ↦ (1 + T)^u - 1`, and every statement below is
invariant under it. The exponentiation is the `ℤ_p`-action on the abelian pro-`p` group `Γ` of
Layer 4, and the right-hand side is its image under the coordinate. -/
theorem completedGroupAlgebra.powerSeriesCoordinate_substitution (γ γ' : Γ) (u : ℤ_[p]ˣ)
    (hγ : (Subgroup.closure ({γ} : Set Γ)).topologicalClosure = ⊤)
    (hγ' : (Subgroup.closure ({γ'} : Set Γ)).topologicalClosure = ⊤)
    (hfree : Nonempty (Γ ≃ₜ* Multiplicative ℤ_[p]))
    (hpow : ∀ e : Γ ≃ₜ* Multiplicative ℤ_[p],
      e γ' = Multiplicative.ofAdd ((u : ℤ_[p]) * Multiplicative.toAdd (e γ))) :
    completedGroupAlgebra.powerSeriesCoordinate p Γ γ' hγ' hfree PowerSeries.X
      = completedGroupAlgebra.ofVal p Γ γ' - 1 ∧
      completedGroupAlgebra.powerSeriesCoordinate p Γ γ hγ hfree PowerSeries.X
        = completedGroupAlgebra.ofVal p Γ γ - 1 :=
  sorry

end ProcyclicCoordinate

/-! ### The dyadic branch `Γ ≅ C₂ × ℤ₂`

The second shape of the orientation image, `V^(f) = {±1} × U^(f)` with `f < ∞`, which Layer 7
proves is not procyclic. Citing the procyclic package for it is the mistake to avoid. -/

section DyadicAlgebra

/-- `C₂` as a genuine cyclic **group** of order two. ⚠ It is not `ZMod 2` read as a
multiplicative monoid, whose monoid algebra is a different ring. -/
abbrev cyclicTwo : Type := Multiplicative (ZMod 2)

variable (Γ : Type u) [Group Γ] [TopologicalSpace Γ]

instance : Fact (Nat.Prime 2) := ⟨Nat.prime_two⟩

/-- **Layer 9, the dyadic coordinate.** For `Γ ≅ C₂ × ℤ₂` the completed algebra is the power
series ring over the group ring `ℤ₂[C₂]`, with `T = γ - 1` for a topological generator `γ` of
the `ℤ₂`-factor. -/
noncomputable def completedGroupAlgebra.dyadicCoordinate
    (hΓ : Nonempty (Γ ≃ₜ* cyclicTwo × Multiplicative ℤ_[2])) :
    PowerSeries (MonoidAlgebra ℤ_[2] cyclicTwo) ≃ₐ[ℤ_[2]] completedGroupAlgebra 2 Γ :=
  sorry

/-- **Layer 9, the dyadic coordinate matches the two filtrations**, in the same form as the
procyclic one. -/
theorem completedGroupAlgebra.dyadicCoordinate_filtration
    (hΓ : Nonempty (Γ ≃ₜ* cyclicTwo × Multiplicative ℤ_[2])) (k : ℕ) :
    ∃ U : OpenNormalSubgroup Γ,
      {x : completedGroupAlgebra 2 Γ | completedGroupAlgebra.proj 2 Γ U x = 0}
        = completedGroupAlgebra.dyadicCoordinate Γ hΓ ''
          {ψ : PowerSeries (MonoidAlgebra ℤ_[2] cyclicTwo) | PowerSeries.X ^ k ∣ ψ} :=
  sorry

/-- **Layer 9, the splitting after inverting `2`.** Over `ℚ₂` the two idempotents
`(1 ± σ)/2` of the group ring split it into the two eigenspaces of the involution, and each
eigenspace of the power-series ring over it is again a power-series ring. -/
noncomputable def monoidAlgebraRatPadicCyclicTwoEquiv :
    MonoidAlgebra ℚ_[2] cyclicTwo ≃ₐ[ℚ_[2]] ℚ_[2] × ℚ_[2] :=
  sorry

/-- **Layer 9, there is no integral splitting.** ⚠ The idempotents above use `1/2`, so `ℤ₂[C₂]`
does **not** decompose: its only idempotents are `0` and `1`. Claiming a direct-product
decomposition over `ℤ₂` is the error this statement rules out. -/
theorem monoidAlgebraPadicIntCyclicTwo_isIdempotentElem
    (e : MonoidAlgebra ℤ_[2] cyclicTwo) (he : e * e = e) : e = 0 ∨ e = 1 :=
  sorry

end DyadicAlgebra

/-! ### Compact modules over `Λ`

The modules that occur in Layer 9 are inverse limits of finite `ℤ_p[Γ/U]`-modules with
surjective transition maps. -/

section CompactModules

variable (p : ℕ) [Fact p.Prime] (Γ : Type u) [Group Γ] [TopologicalSpace Γ]

/-- **Layer 9, a compact `Λ`-module.** Separatedness and completeness are packaged as
compactness together with total disconnectedness, which for a topological module over a compact
ring is the same condition and is what the inverse-limit description needs. -/
structure IsCompactModule (M : Type u) [AddCommGroup M]
    [Module (completedGroupAlgebra p Γ) M] [TopologicalSpace M] : Prop where
  /-- the module is a topological additive group -/
  isTopologicalAddGroup : IsTopologicalAddGroup M
  /-- the scalar action is continuous -/
  continuousSMul : ContinuousSMul (completedGroupAlgebra p Γ) M
  /-- the module is compact -/
  compactSpace : CompactSpace M
  /-- the module is profinite -/
  totallyDisconnectedSpace : TotallyDisconnectedSpace M

variable (M : Type u) [AddCommGroup M] [Module (completedGroupAlgebra p Γ) M]
  [TopologicalSpace M]

/-- **Layer 9, separatedness.** An element in every open submodule is `0`. -/
theorem IsCompactModule.eq_zero_of_mem_open (hM : IsCompactModule p Γ M) (x : M)
    (h : ∀ N : Submodule (completedGroupAlgebra p Γ) M, IsOpen (N : Set M) → x ∈ N) : x = 0 :=
  sorry

/-- **Layer 9, the inverse-limit description.** A compact `Λ`-module is the inverse limit of
its quotients by the open submodules, and the transition maps of that system are surjective.
This is the form in which `Λ`-module statements are proved level by level. -/
theorem IsCompactModule.surjective_quotient_transition (hM : IsCompactModule p Γ M)
    (N N' : Submodule (completedGroupAlgebra p Γ) M) (hN : IsOpen (N : Set M))
    (hN' : IsOpen (N' : Set M)) (h : N' ≤ N) :
    Function.Surjective (Submodule.mapQ N' N LinearMap.id h) :=
  sorry

/-- **Layer 9, quotients stay compact.** -/
theorem IsCompactModule.quotient (hM : IsCompactModule p Γ M)
    (N : Submodule (completedGroupAlgebra p Γ) M) (hN : IsClosed (N : Set M)) :
    IsCompactModule p Γ (M ⧸ N) :=
  sorry

end CompactModules

section CompactModuleLimits

/-- **Layer 9, exactness of inverse limits of compact modules.** Along a tower with surjective
transition maps and levelwise surjective comparison maps between compact levels, a compatible
family downstairs lifts to a compatible family upstairs. This is the compactness statement that
lets the annihilator and membership criteria below be checked level by level; without
surjectivity of the transition maps it is false. -/
theorem compactModule_limit_surjective (A : ℕ → Type u) (B : ℕ → Type u)
    [∀ k, AddCommGroup (A k)] [∀ k, TopologicalSpace (A k)] [∀ k, CompactSpace (A k)]
    [∀ k, AddCommGroup (B k)] [∀ k, TopologicalSpace (B k)]
    (fA : ∀ k, A (k + 1) →+ A k) (fB : ∀ k, B (k + 1) →+ B k) (g : ∀ k, A k →+ B k)
    (hcont : ∀ k, Continuous (fA k)) (hcontg : ∀ k, Continuous (g k))
    (hsq : ∀ (k : ℕ) (a : A (k + 1)), g k (fA k a) = fB k (g (k + 1) a))
    (hsurjA : ∀ k, Function.Surjective (fA k)) (hsurjg : ∀ k, Function.Surjective (g k))
    (b : ∀ k, B k) (hb : ∀ k, fB k (b (k + 1)) = b k) :
    ∃ a : ∀ k, A k, (∀ k, fA k (a (k + 1)) = a k) ∧ ∀ k, g k (a k) = b k :=
  sorry

end CompactModuleLimits

/-! ### Labute's relation module

Labute's §4 arguments do **not** run on the full abelianized relation module `R^{ab}`. His
object (§4 Definition, p. 121) is `E = X/(X, X)` for `X = ker χ ≤ F`, the abelianized kernel of
the orientation *on the free group*, with `Γ = F/X ≅ Im χ` acting by conjugation and
`Λ = ℤ_p[[Γ]]` acting through that. The relator enters through its image `r̄ ∈ E`, since
`r ∈ R ⊆ X`. -/

section RelationModule

variable (p : ℕ) [Fact p.Prime] (F : Type u) [Group F] [TopologicalSpace F]
  [IsTopologicalGroup F] (χ : F →* ℤ_[p]ˣ)

/-- **`X = ker χ`**, the kernel of the orientation character on the free group `F`. It contains
the relation subgroup `R`, and it is what Labute abelianizes. -/
noncomputable def orientationKernel : Subgroup F := χ.ker

noncomputable instance orientationKernel_normal : (orientationKernel p F χ).Normal :=
  inferInstanceAs (MonoidHom.ker χ).Normal

/-- **`E = X/(X, X)`**, Labute's module (§4 Definition, p. 121): the topological abelianization
of `ker χ`, written additively. ⚠ It is **not** `R/[R, R]` and **not** `R/[F, R]`; those are
quotients of the relation subgroup, while `E` is built from the whole of `ker χ`. -/
noncomputable abbrev labuteE : Type u :=
  Additive (topAbelianization ↥(orientationKernel p F χ))

/-- **`Γ = F/X`**, which the first isomorphism theorem identifies with `Im χ`. -/
noncomputable abbrev orientationQuotient : Type u := F ⧸ orientationKernel p F χ

/-- **Layer 9, `Γ ≅ Im χ`.** -/
noncomputable def orientationQuotientEquivRange :
    orientationQuotient p F χ ≃* (χ.range : Subgroup ℤ_[p]ˣ) :=
  sorry

/-- **Layer 9, `E` is abelian.** The topological abelianization of a topological group is
abelian; it is stated as an equation rather than installed as a `CommGroup` instance, because a
second group structure on the quotient would not be definitionally the first. -/
theorem labuteE_add_comm (x y : labuteE p F χ) : x + y = y + x := sorry

/-- **Layer 9, the action of `Γ` on `E`.** For `α = ȳ ∈ Γ` and `ξ = x̄ ∈ E`, the element `α · ξ`
is the class of `y⁻¹xy` (Labute §4 Definition, p. 121). ⚠ This is the **conjugation** action of
`Γ`, and not scalar multiplication through `χ`: `ℤ_p² = ⟨x, y ∣ (x, y)⟩` has trivial orientation
while its conjugation action on the relation module is not trivial, so the scalar reading is
false. -/
noncomputable def labuteAction :
    orientationQuotient p F χ → labuteE p F χ → labuteE p F χ :=
  sorry

/-- **Layer 9, the action is an action by additive automorphisms.** -/
theorem labuteAction_laws (α β : orientationQuotient p F χ) (ξ η : labuteE p F χ) :
    labuteAction p F χ 1 ξ = ξ ∧
      labuteAction p F χ (α * β) ξ = labuteAction p F χ α (labuteAction p F χ β ξ) ∧
      labuteAction p F χ α (ξ + η) = labuteAction p F χ α ξ + labuteAction p F χ α η :=
  sorry

/-- **Layer 9, the defining equation of the action**: it is conjugation, and it descends to
`Γ` precisely because inner automorphisms by elements of `X` act trivially on `X/(X, X)`. This
equation is the content of "the action factors through `Γ = Im χ`". -/
theorem labuteAction_apply (y : F) (x : ↥(orientationKernel p F χ))
    (hyx : y⁻¹ * (x : F) * y ∈ orientationKernel p F χ) :
    labuteAction p F χ (QuotientGroup.mk y)
        (Additive.ofMul (QuotientGroup.mk x :
          topAbelianization ↥(orientationKernel p F χ)))
      = Additive.ofMul (QuotientGroup.mk
          (⟨y⁻¹ * (x : F) * y, hyx⟩ : ↥(orientationKernel p F χ)) :
          topAbelianization ↥(orientationKernel p F χ)) :=
  sorry

/-- **Layer 9, the scalar action of `Λ = ℤ_p[[Γ]]` on `E`.** The continuous extension of the
conjugation action of `Γ`. It is written as a named map with its laws below rather than as a
`Module` instance, because `E` carries no `AddCommGroup` instance until `labuteE_add_comm` is
discharged, and installing one would create a second additive structure on the quotient. The
laws below are exactly the module axioms. -/
noncomputable def labuteSMul :
    completedGroupAlgebra p (orientationQuotient p F χ) → labuteE p F χ → labuteE p F χ :=
  sorry

/-- **Layer 9, the scalar action extends the conjugation action.** -/
theorem labuteSMul_of (γ : orientationQuotient p F χ) (ξ : labuteE p F χ) :
    labuteSMul p F χ (completedGroupAlgebra.ofVal p (orientationQuotient p F χ) γ) ξ
      = labuteAction p F χ γ ξ :=
  sorry

/-- **Layer 9, the module axioms for the scalar action.** -/
theorem labuteSMul_laws (a b : completedGroupAlgebra p (orientationQuotient p F χ))
    (ξ η : labuteE p F χ) :
    labuteSMul p F χ 1 ξ = ξ ∧
      labuteSMul p F χ (a * b) ξ = labuteSMul p F χ a (labuteSMul p F χ b ξ) ∧
      labuteSMul p F χ (a + b) ξ = labuteSMul p F χ a ξ + labuteSMul p F χ b ξ ∧
      labuteSMul p F χ a (ξ + η) = labuteSMul p F χ a ξ + labuteSMul p F χ a η :=
  sorry

/-- **Layer 9, the scalar action is continuous.** -/
theorem labuteSMul_continuous :
    Continuous fun x : completedGroupAlgebra p (orientationQuotient p F χ) × labuteE p F χ =>
      labuteSMul p F χ x.1 x.2 :=
  sorry

/-- **Layer 9, the map from the full relation module.** The inclusion `R ⊆ X = ker χ` induces
`R^{ab} → E`. Labute's proofs use only the image of the relator under this map, which is why
`R^{ab}` itself carries no statement here. -/
noncomputable def relationModuleToLabuteE (R : Subgroup F) [R.Normal]
    (hR : R ≤ orientationKernel p F χ) :
    Additive (topAbelianization ↥R) →+ labuteE p F χ :=
  sorry

/-- **`r̄ ∈ E`**, the image of a relator. This is the element every Labute computation is
about. -/
noncomputable def labuteRelatorClass (r : F) (hr : r ∈ orientationKernel p F χ) :
    labuteE p F χ :=
  Additive.ofMul (QuotientGroup.mk (⟨r, hr⟩ : ↥(orientationKernel p F χ)) :
    topAbelianization ↥(orientationKernel p F χ))

/-- **Layer 9, the relator class is the image of the relator under `R^{ab} → E`.** -/
theorem relationModuleToLabuteE_relator (R : Subgroup F) [R.Normal]
    (hR : R ≤ orientationKernel p F χ) (r : F) (hrR : r ∈ R) :
    relationModuleToLabuteE p F χ R hR
        (Additive.ofMul (QuotientGroup.mk (⟨r, hrR⟩ : ↥R) : topAbelianization ↥R))
      = labuteRelatorClass p F χ r (hR hrR) :=
  sorry

end RelationModule

/-! ### The two module criteria that the classification uses

With `E` and `Λ` as above, a chosen topological generator `γ` of `Γ` and `T = γ - 1`, these are
the statements Labute Thms 5 and 6 run on: the expression of `r̄` in a `Λ`-basis, the basis
correction that the division criterion produces, and the resulting normal form. -/

section ModuleCriteria

variable (p : ℕ) [Fact p.Prime] (F : Type u) [Group F] [TopologicalSpace F]
  [IsTopologicalGroup F] (χ : F →* ℤ_[p]ˣ)

/-- **Layer 9, `E` is topologically generated by the classes of the basis elements lying in
`X`.** For `F = freeProP p (Fin n)` with basis `x_1, …, x_n` and `χ` a Demushkin orientation,
finitely many classes `ȳ_i ∈ E` generate `E` over `Λ`. This is the statement Labute's expression
of `r̄` is read in. Generation is stated on the multiplicative quotient, where the topology
lives. -/
theorem labuteE_exists_generators (n : ℕ) (hF : Nonempty (F ≃ₜ* freeProP p (Fin n))) :
    ∃ (m : ℕ) (b : Fin m → labuteE p F χ),
      (Subgroup.closure {x : topAbelianization ↥(orientationKernel p F χ) |
          ∃ (i : Fin m) (l : completedGroupAlgebra p (orientationQuotient p F χ)),
            x = Additive.toMul (labuteSMul p F χ l (b i))}).topologicalClosure = ⊤ :=
  sorry

/-- **Layer 9, the expression of the relator image** (Labute p. 122). In the dyadic even-rank
branch the class `r̄` is the `Λ`-combination
`r̄ = (1 + a + (1+T)^a) ȳ₁ + (2^g + (1+T)^{ab} − 1) ȳ₃`
of the basis classes lying in `X`. The statement here is the shape of that expression: `r̄` is a
`Λ`-combination of the generators, with the coefficients read off the normal form of `r`. -/
theorem labuteRelatorClass_eq_sum (n : ℕ) (hF : Nonempty (F ≃ₜ* freeProP p (Fin n)))
    (r : F) (hr : r ∈ orientationKernel p F χ) (m : ℕ) (b : Fin m → labuteE p F χ) :
    ∃ c : Fin m → completedGroupAlgebra p (orientationQuotient p F χ),
      labuteRelatorClass p F χ r hr
        = ∑ i : Fin m, labuteSMul p F χ (c i) (b i) :=
  sorry

/-- **Layer 9, the basis correction** (Labute p. 122). Applying the division criterion
`(T − c) ∣ ψ ↔ ψ(c) = 0` to the coefficients of the expression above replaces the generators by
ones in which the relator image is a single multiple: for the dyadic even-rank relator of
parameters `(α, f)` there is `z₁` with `r̄ = (2 + 2^f + T) z̄₁`. The corrections iterate along
the descending `2`-central series, which is where Layer 8's comparison schema takes over. -/
theorem labuteRelatorClass_eq_smul_of_dyadic (f : ℕ) (hf : 2 ≤ f) (hp : p = 2)
    (γ : orientationQuotient p F χ)
    (hγ : (Subgroup.closure ({γ} : Set (orientationQuotient p F χ))).topologicalClosure = ⊤)
    (r : F) (hr : r ∈ orientationKernel p F χ) :
    ∃ z : labuteE p F χ,
      labuteRelatorClass p F χ r hr
        = labuteSMul p F χ
            (algebraMap ℤ_[p] (completedGroupAlgebra p (orientationQuotient p F χ))
                (2 + 2 ^ f)
              + (completedGroupAlgebra.ofVal p (orientationQuotient p F χ) γ - 1)) z :=
  sorry

/-- **Layer 9, the annihilator is principal.** The annihilator of `E` as a `Λ`-module is a
closed ideal, and under the power-series coordinate it is generated by one element, the
*relator series* `ψ_r`, read off the normal form of `r`. Two relators with the same invariants
have associated series, that is they differ by a unit of `Λ`. -/
theorem labuteE_annihilator_isPrincipal (r : F) (hr : r ∈ orientationKernel p F χ) :
    ∃ ψ : completedGroupAlgebra p (orientationQuotient p F χ),
      ∀ l : completedGroupAlgebra p (orientationQuotient p F χ),
        (∀ ξ : labuteE p F χ, labuteSMul p F χ l ξ = 0) ↔ ψ ∣ l :=
  sorry

/-- **Layer 9, the membership criterion.** For `λ ∈ Λ` corresponding to `T − c` under a
power-series coordinate `e`, membership of the relator class in `λE` is the vanishing `ψ_r(c) = 0`
of the relator series at `c`. This is where the division criterion
`powerSeries_sub_C_dvd_iff` enters, and it is what produces the basis correction above: the
correction exists exactly when the membership holds. -/
theorem labuteRelatorClass_mem_smul_iff (r : F) (hr : r ∈ orientationKernel p F χ)
    (ψr : PowerSeries ℤ_[p]) (c : ℤ_[p]) (hc : (p : ℤ_[p]) ∣ c)
    (e : PowerSeries ℤ_[p] ≃ₐ[ℤ_[p]] completedGroupAlgebra p (orientationQuotient p F χ))
    (hψr : ∀ l : completedGroupAlgebra p (orientationQuotient p F χ),
      (∀ ξ : labuteE p F χ, labuteSMul p F χ l ξ = 0) ↔ e ψr ∣ l) :
    (∃ ξ : labuteE p F χ,
        labuteRelatorClass p F χ r hr
          = labuteSMul p F χ (e (PowerSeries.X - PowerSeries.C (R := ℤ_[p]) c)) ξ)
      ↔ powerSeriesEval p ψr c hc = 0 :=
  sorry

end ModuleCriteria

/-! ## Layer 9: the marked normal forms

The classification is stated in marked form: for each Labute normal-form family, an isomorphism
onto the presented pro-`p` group on that relator, carrying the canonical character to the
explicit values of the character table. The unmarked isomorphism statements are corollaries. -/

section MarkedNormalForms

/-- Labute's commutator `(x, y) = x⁻¹y⁻¹xy`, the convention the normal-form words use.
⚠ Mathlib's `⁅x, y⁆` is `xyx⁻¹y⁻¹`, the other convention; the two generate the same subgroups
because `(x, y) = ⁅x⁻¹, y⁻¹⁆`, so subgroup statements use Mathlib's bracket and relator words
use this one. -/
def labuteComm {H : Type*} [Group H] (x y : H) : H := x⁻¹ * y⁻¹ * x * y

/-- The generators of `freeProP p (Fin n)` indexed by `ℕ`, with value `1` out of range, so that
the normal-form words below carry no index-bound side conditions. -/
noncomputable def freeProPGen (p n : ℕ) (i : ℕ) : freeProP p (Fin n) :=
  if h : i < n then freeProP.of p ⟨i, h⟩ else 1

/-- The generators of a presented pro-`p` group, as the images of `freeProPGen`. -/
noncomputable def presentedProPGen (p n : ℕ) (rels : Set (freeProP p (Fin n))) (i : ℕ) :
    presentedProP p (Fin n) rels :=
  QuotientGroup.mk (freeProPGen p n i)

/-- The `q ≠ 2` normal-form word `x₁^q(x₁,x₂)(x₃,x₄)⋯(x_{n-1},x_n)`, on an arbitrary tuple. -/
def demushkinWordNeTwo {H : Type*} [Group H] (q n : ℕ) (x : ℕ → H) : H :=
  x 0 ^ q * ((List.range (n / 2)).map fun i => labuteComm (x (2 * i)) (x (2 * i + 1))).prod

/-- The `q = 2`, `n` odd normal-form word `x₁²x₂^{2^f}(x₂,x₃)(x₄,x₅)⋯`, on an arbitrary tuple.
The parameter `f` is finite here; the value `f = ∞` is the separate word with `x₂^{2^f}`
replaced by `1`. -/
def demushkinWordTwoOdd {H : Type*} [Group H] (f n : ℕ) (x : ℕ → H) : H :=
  x 0 ^ 2 * x 1 ^ (2 ^ f) *
    ((List.range (n / 2)).map fun i => labuteComm (x (2 * i + 1)) (x (2 * i + 2))).prod

/-- The `q = 2`, `n` even normal-form word `x₁^{2+α}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯`, on an arbitrary
tuple, with the exponent `2 + α` given as a `2`-adic exponent through the `ℤ₂`-action on the
abelianization; here it is written with the natural-number exponent `2 + a` that represents it
at each finite level. -/
def demushkinWordTwoEven {H : Type*} [Group H] (a f n : ℕ) (x : ℕ → H) : H :=
  x 0 ^ (2 + a) * labuteComm (x 0) (x 1) * x 2 ^ (2 ^ f) *
    ((List.range (n / 2 - 1)).map fun i =>
      labuteComm (x (2 * i + 2)) (x (2 * i + 3))).prod

variable (p : ℕ) [Fact p.Prime] (G : Type) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
  [CompactSpace G] [TotallyDisconnectedSpace G]

/-- **Layer 9, the marked classification at `q ≠ 2`.** A Demushkin group with `q ≠ 2` and rank
`n` is isomorphic to the presented group on the normal-form relator, by an isomorphism under
which the canonical character has the tabulated values: `χ(x₂)(1 - q) = 1` and `χ(x_i) = 1` on
every other generator. The equation on `x₂` is written as a product in `ℤ_p` rather than as an
inverse, so that no unit has to be constructed to state it. -/
theorem isDemushkin_marked_of_q_ne_two (hG : IsDemushkin p G) (hq : demushkinQ hG ≠ 2)
    (hn : 2 ≤ demushkinRank hG)
    [TotallyDisconnectedSpace (presentedProP p (Fin (demushkinRank hG))
      {demushkinWordNeTwo (demushkinQ hG) (demushkinRank hG)
        (freeProPGen p (demushkinRank hG))})] :
    ∃ e : G ≃ₜ* presentedProP p (Fin (demushkinRank hG))
        {demushkinWordNeTwo (demushkinQ hG) (demushkinRank hG)
          (freeProPGen p (demushkinRank hG))},
      ((demushkinCharacter hG (e.symm (presentedProPGen p (demushkinRank hG) _ 1)) : ℤ_[p])
          * (1 - (demushkinQ hG : ℤ_[p])) = 1) ∧
        ∀ i : ℕ, i ≠ 1 → i < demushkinRank hG →
          demushkinCharacter hG (e.symm (presentedProPGen p (demushkinRank hG) _ i)) = 1 :=
  sorry

/-- **Layer 9, the marked classification at `q = 2` with `n` odd.** Here `p = 2`, the relator is
`x₁²x₂^{2^f}(x₂,x₃)⋯`, and the character values are `χ(x₁) = -1`, `χ(x₃)(1 - 2^f) = 1`, and `1`
elsewhere. The standard abstract group `D₀` is the case `n = 3`, `f = 2`.
⚠ `f` is an **invariant of `G`**, not a free parameter, and `hfG` is what says so: it asserts
that the character value the conclusion pins is attained. Without it the statement reads "for
every `f ≥ 2` there is a marked isomorphism onto the presented group with that `f`", and those
presented groups are pairwise non-isomorphic, so all but one instance is false. The same trap
applies to the even case below, and to any later theorem that lets a normal-form parameter float
free of the group it classifies. -/
theorem isDemushkin_marked_of_q_two_odd (hp : p = 2) (hG : IsDemushkin p G)
    (hq : demushkinQ hG = 2) (hodd : Odd (demushkinRank hG)) (f : ℕ) (hf : 2 ≤ f)
    (hfG : ∃ x : G, (demushkinCharacter hG x : ℤ_[p]) * (1 - 2 ^ f) = 1)
    [TotallyDisconnectedSpace (presentedProP p (Fin (demushkinRank hG))
      {demushkinWordTwoOdd f (demushkinRank hG) (freeProPGen p (demushkinRank hG))})] :
    ∃ e : G ≃ₜ* presentedProP p (Fin (demushkinRank hG))
        {demushkinWordTwoOdd f (demushkinRank hG) (freeProPGen p (demushkinRank hG))},
      demushkinCharacter hG (e.symm (presentedProPGen p (demushkinRank hG) _ 0)) = -1 ∧
        ((demushkinCharacter hG (e.symm (presentedProPGen p (demushkinRank hG) _ 2)) : ℤ_[p])
          * (1 - 2 ^ f) = 1) ∧
        ∀ i : ℕ, i ≠ 0 → i ≠ 2 → i < demushkinRank hG →
          demushkinCharacter hG (e.symm (presentedProPGen p (demushkinRank hG) _ i)) = 1 :=
  sorry

/-- **Layer 9, the marked classification at `q = 2` with `n` even.** The relator is
`x₁^{2+α}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯`, and the character values are `χ(x₂)(1 + α) = -1`,
`χ(x₄)(1 - 2^f) = 1`, and `1` elsewhere. The image is `{±1} × U^(f)` when `v₂(α) ≥ f`, and
`U^[v₂(α)]` otherwise, which is the table of Layer 7.
⚠ As in the odd case, `a` and `f` are invariants of `G` and `haG`/`hfG` are what pin them; with
both parameters free the statement is false for every pair but one. -/
theorem isDemushkin_marked_of_q_two_even (hp : p = 2) (hG : IsDemushkin p G)
    (hq : demushkinQ hG = 2) (heven : Even (demushkinRank hG)) (a f : ℕ) (hf : 2 ≤ f)
    (ha : 4 ∣ a)
    (haG : ∃ x : G, (demushkinCharacter hG x : ℤ_[p]) * (1 + (a : ℤ_[p])) = -1)
    (hfG : ∃ x : G, (demushkinCharacter hG x : ℤ_[p]) * (1 - 2 ^ f) = 1)
    [TotallyDisconnectedSpace (presentedProP p (Fin (demushkinRank hG))
      {demushkinWordTwoEven a f (demushkinRank hG) (freeProPGen p (demushkinRank hG))})] :
    ∃ e : G ≃ₜ* presentedProP p (Fin (demushkinRank hG))
        {demushkinWordTwoEven a f (demushkinRank hG) (freeProPGen p (demushkinRank hG))},
      ((demushkinCharacter hG (e.symm (presentedProPGen p (demushkinRank hG) _ 1)) : ℤ_[p])
          * (1 + (a : ℤ_[p])) = -1) ∧
        ((demushkinCharacter hG (e.symm (presentedProPGen p (demushkinRank hG) _ 3)) : ℤ_[p])
          * (1 - 2 ^ f) = 1) ∧
        ∀ i : ℕ, i ≠ 1 → i ≠ 3 → i < demushkinRank hG →
          demushkinCharacter hG (e.symm (presentedProPGen p (demushkinRank hG) _ i)) = 1 :=
  sorry

/-- **Layer 9, Labute Thm 2: relators with the same invariants are equivalent under an
automorphism of `F`.** This is the statement the marked instances above rest on: it is what
turns "isomorphic" into "isomorphic by a basis change", so the marked normal form is a
normalization and not a choice. -/
theorem exists_continuousMulEquiv_map_demushkinRelator (n : ℕ) (r r' : freeProP p (Fin n))
    [TotallyDisconnectedSpace (freeProP p (Fin n))]
    [TotallyDisconnectedSpace (presentedProP p (Fin n) {r})]
    [TotallyDisconnectedSpace (presentedProP p (Fin n) {r'})]
    (hr : IsDemushkin p (presentedProP p (Fin n) {r}))
    (hr' : IsDemushkin p (presentedProP p (Fin n) {r'}))
    (hrank : demushkinRank hr = demushkinRank hr')
    (himage : (demushkinCharacter hr).range = (demushkinCharacter hr').range) :
    ∃ φ : freeProP p (Fin n) ≃ₜ* freeProP p (Fin n),
      (Subgroup.normalClosure {φ r}).topologicalClosure
        = (Subgroup.normalClosure {r'}).topologicalClosure :=
  sorry

end MarkedNormalForms

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
completion adjunction is bijective on a finite (discrete) group: the non-vacuity check for
the completion layer. -/
example {G : Type u} [Group G] [Finite G] :
    Function.Bijective (ProfiniteGrp.ProfiniteCompletion.etaFn (GrpCat.of G)) :=
  sorry

/-! ## Layer 1: the supernatural order and index -/

/-- **Layer 1, the order of a finite group.** On a finite discrete group the supernatural
order is the prime factorization of `Nat.card G`, the compatibility that keeps
`profiniteOrder` honest. -/
example {G : Type u} [Group G] [TopologicalSpace G] [DiscreteTopology G] [Finite G]
    (p : Nat.Primes) : profiniteOrder G p = (padicValNat p (Nat.card G) : ℕ∞) :=
  sorry

/-- **Layer 1, the index of an open subgroup.** The supernatural index of an open subgroup is
the factorization of Mathlib's `Nat.card`-valued `Subgroup.index`, the compatibility that
pins `profiniteIndex` against the existing API. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (U : OpenSubgroup G) (ℓ : Nat.Primes) :
    profiniteIndex U.toSubgroup ℓ = (padicValNat ℓ U.toSubgroup.index : ℕ∞) :=
  sorry

/-- **Layer 1, the index of a closed subgroup as an lcm.** For closed `H`, the primewise
definition agrees with the supremum, over open subgroups above `H`, of their indices. This is
the description the literature uses; it fails for non-closed `H`, which is why closedness is
a hypothesis here and not decoration. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (H : Subgroup G) (hH : IsClosed (H : Set G))
    (ℓ : Nat.Primes) :
    profiniteIndex H ℓ = ⨆ U : {U : OpenSubgroup G // H ≤ U.toSubgroup},
      (padicValNat ℓ U.1.toSubgroup.index : ℕ∞) :=
  sorry

/-- **Layer 1, Lagrange.** The supernatural order of a profinite group is the product of the
order of a closed subgroup and its index (Ribes–Zalesskii §2.3). -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (H : Subgroup G) (hH : IsClosed (H : Set G))
    (ℓ : Nat.Primes) :
    profiniteOrder G ℓ = profiniteOrder H ℓ + profiniteIndex H ℓ :=
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
limit point). The interface table names this theorem, so it is a stable declaration. -/
theorem exists_isProPSylow (p : ℕ) [Fact p.Prime] (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] :
    ∃ P : Subgroup G, IsProPSylow p P :=
  sorry

/-- **Layer 2, every closed pro-`p` subgroup lies in a `p`-Sylow subgroup.** -/
theorem IsProP.exists_le_isProPSylow (p : ℕ) [Fact p.Prime] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (Q : Subgroup G) (hQ : IsProP p Q) (hQc : IsClosed (Q : Set G)) :
    ∃ P : Subgroup G, IsProPSylow p P ∧ Q ≤ P :=
  sorry

/-- **Layer 2, a normal `p`-Sylow subgroup is the only one.** -/
theorem IsProPSylow.eq_of_normal (p : ℕ) [Fact p.Prime] (G : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (P Q : Subgroup G) (hP : IsProPSylow p P) (hQ : IsProPSylow p Q) (hn : P.Normal) :
    P = Q :=
  sorry

/-- **Layer 2, the image of a `p`-Sylow subgroup under a continuous surjection.** -/
theorem IsProPSylow.map_of_surjective (p : ℕ) [Fact p.Prime] (G H : Type u) [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H]
    [TotallyDisconnectedSpace H] (f : G →* H) (hf : Continuous f)
    (hsurj : Function.Surjective f) (P : Subgroup G) (hP : IsProPSylow p P) :
    IsProPSylow p (P.map f) :=
  sorry

/-- **Layer 2, conjugacy of `p`-Sylow subgroups.** Any two `p`-Sylow subgroups of a profinite
group are conjugate. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] {P Q : Subgroup G}
    (hP : IsProPSylow p P) (hQ : IsProPSylow p Q) :
    ∃ g : G, Q = P.map (MulAut.conj g).toMonoidHom :=
  sorry

/-- **Layer 2, Galois-group acceptance example.** The Galois group of any Galois extension,
with its Krull topology, has a `p`-Sylow subgroup. This is the abstract group-theoretic half
of the fixed-field statement that maximal prime-to-`p` subextensions exist; the fixed-field
dictionary is deliberately left to a Galois-theory consumer. -/
example (p : ℕ) [Fact p.Prime] {k K : Type u} [Field k] [Field K] [Algebra k K]
    [IsGalois k K] : ∃ P : Subgroup (K ≃ₐ[k] K), IsProPSylow p P :=
  sorry

/-- **Layer 2, the `p`-Sylow subgroup of `ℤ̂`.** Every `p`-Sylow subgroup of the profinite
completion of `ℤ` is isomorphic, as a topological group, to `ℤ_p`. Stated here, proved in
Layer 4 through the chain of universal properties; in particular **not** through a product
decomposition `ℤ̂ ≅ ∏_ℓ ℤ_ℓ`, which is not a target of this roadmap. -/
example (p : ℕ) [Fact p.Prime] (P : Subgroup zHat) (hP : IsProPSylow p P) :
    Nonempty (P ≃ₜ* Multiplicative ℤ_[p]) :=
  sorry

/-! ## Layer 3: pro-`p` groups, the maximal pro-`p` quotient, Frattini theory, generation -/

/-- **Layer 3, the maximal pro-`p` quotient is pro-`p`.** (Compactness argument: an open
normal subgroup containing the pro-`p` kernel already contains a member of the defining
family.) -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] : IsProP p (maximalProPQuotient p G) :=
  sorry

/-- **Layer 3, universal property of the maximal pro-`p` quotient.** Continuous homomorphisms
from `G` to a pro-`p` profinite group factor uniquely through `G(p)`. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] {P : Type v} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] (hP : IsProP p P)
    (f : G →* P) (hf : Continuous f) :
    ∃! g : maximalProPQuotient p G →* P,
      Continuous g ∧ ∀ x : G, g (QuotientGroup.mk x) = f x :=
  sorry

/-- **Layer 3, the pro-`p` kernel is closed.** -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] :
    IsClosed ((proPKernel p G : Subgroup G) : Set G) :=
  sorry

/-- **Layer 3, the pro-`p` kernel is topologically characteristic.** Invariance under
*continuous* automorphisms is the right statement: the subgroup is defined through open normal
subgroups, and an abstract automorphism of a profinite group need not be continuous. The same
statement is wanted for `proPFrattini` and for every `pLowerCentralSeries` term. -/
example {p : ℕ} {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (f : G ≃ₜ* G) :
    (proPKernel p G).map f.toMulEquiv.toMonoidHom = proPKernel p G :=
  sorry

/-- **Layer 3, the Frattini subgroup is closed and normal.** Its characteristicity is the
`ContinuousMulEquiv`-invariance statement above with `proPFrattini` in place of
`proPKernel`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G) :
    IsClosed ((proPFrattini p G : Subgroup G) : Set G) ∧ (proPFrattini p G).Normal :=
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
    (h : ∀ U : OpenNormalSubgroup G, U.toSubgroup.index = p → ¬ H ≤ U.toSubgroup) :
    H = ⊤ :=
  sorry

/-- **Layer 3, the Burnside basis surjectivity criterion (hom form).** A continuous
homomorphism between pro-`p` profinite groups whose composites to all index-`p` quotients of
the target are surjective is surjective: the criterion used everywhere for checking
surjectivity on generators mod Frattini. -/
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
Mathlib's idiom for finiteness of the quotient), the Burnside basis theorem's counting
half. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G) :
    IsTopologicallyFinitelyGenerated G ↔ (proPFrattini p G).index ≠ 0 :=
  sorry

/-- **Layer 3, the two rank notions agree.** The natural-number accessor computes the
cardinal rank whenever it is available. Every theorem that subtracts ranks is stated with the
accessor and this equality is how it connects to the general theory. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    (h : IsTopologicallyFinitelyGenerated G) :
    (topologicalGeneratorRankNat G h : Cardinal.{u}) = topologicalGeneratorRank G :=
  sorry

/-- **Layer 3, Burnside basis theorem, generation form.** A subset generates a pro-`p` group
topologically iff its image generates the Frattini quotient topologically. The closure on the
quotient side is not decoration: at infinite rank the images of a generating set span only a
dense subspace of `G/Φ(G)`. This is the statement every later layer uses, and it needs no
finiteness hypothesis and no vector-space structure. The cardinal form, against the discrete
dual `Hom_cont(G, 𝔽_p)`, is the companion statement; it is *not* an identity with
`Module.rank (ZMod p) (G/Φ(G))`, which is strictly larger at infinite rank. The interface
table names this theorem. -/
theorem topologicallyGenerates_iff_frattiniQuotient (p : ℕ) [Fact p.Prime] (G : Type u)
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hG : IsProP p G) (s : Set G) :
    (Subgroup.closure s).topologicalClosure = ⊤ ↔
      (Subgroup.closure ((QuotientGroup.mk' (proPFrattini p G)) '' s)).topologicalClosure
        = ⊤ :=
  sorry

/-- **Layer 3, the rank does not increase under a continuous surjection.** -/
theorem topologicalGeneratorRank_le_of_surjective (G H : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [Group H] [TopologicalSpace H] [IsTopologicalGroup H] (f : G →* H)
    (hf : Continuous f) (hsurj : Function.Surjective f) :
    topologicalGeneratorRank H ≤ topologicalGeneratorRank G :=
  sorry

/-- **Layer 3, the Schreier bound** `d(U) ≤ 1 + [G : U](d(G) − 1)` for an open subgroup. The
subtraction is harmless because `d(G) ≥ 1` whenever `U` is proper; the equality case for free
pro-`p` groups is Layer 6. The interface table names this theorem. -/
theorem topologicalGeneratorRankNat_le_of_isOpen (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] (U : Subgroup G) (hU : IsOpen (U : Set G))
    (hG : IsTopologicallyFinitelyGenerated G) (hUfg : IsTopologicallyFinitelyGenerated U) :
    topologicalGeneratorRankNat U hUfg
      ≤ 1 + U.index * (topologicalGeneratorRankNat G hG - 1) :=
  sorry

/-- **Layer 3, every profinite group has a generating set converging to `1`**
(RZ Prop. 2.6.2). This is what makes `topologicalGeneratorRank` an infimum over a nonempty
family, so it comes before any theorem that computes a rank. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] :
    ∃ s : Set G, ConvergesToOne s ∧ (Subgroup.closure s).topologicalClosure = ⊤ :=
  sorry

/-- **Layer 3, Burnside basis theorem, numerical form.** For a topologically finitely
generated pro-`p` group the Frattini quotient has order `p^{d(G)}`: the count that turns the
generation statement into the rank formula `d(G) = dim_{𝔽_p} G/Φ(G)`. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    (hfg : IsTopologicallyFinitelyGenerated G) :
    Nat.card (G ⧸ proPFrattini p G) = p ^ topologicalGeneratorRankNat G hfg :=
  sorry

/-- **Layer 3, the Gaschütz lifting lemma.** Along a continuous surjection of profinite
groups, a topological generating tuple of the target lifts to a topological generating tuple
of the source, provided the source is generated by that many elements. (Nakayama-style
generator lifting; the mechanism behind minimal presentations.) -/
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
endomorphism of a topologically finitely generated profinite group is an isomorphism, the
last step of every two-sided comparison argument (Layer 8). -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hfg : IsTopologicallyFinitelyGenerated G) (f : G →* G)
    (hc : Continuous f) (hs : Function.Surjective f) : Function.Bijective f :=
  sorry

/-- **Layer 3, countably many open normal subgroups.** A topologically finitely generated
profinite group has finitely many open subgroups of each index, hence countably many open
normal subgroups. This is the hypothesis later layers carry explicitly; it is **not** a
Layer 0 statement, because its proof needs the finiteness count proved here. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hfg : IsTopologicallyFinitelyGenerated G) :
    Countable (OpenNormalSubgroup G) :=
  sorry

/-- **Layer 3, a descending cofinal sequence of open normal subgroups.** The sequential form
that Layer 8's assembly arguments use, obtained from countability by intersecting finite
initial segments. -/
example {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (hfg : IsTopologicallyFinitelyGenerated G) :
    ∃ N : ℕ → OpenNormalSubgroup G, (∀ k, (N (k + 1)).toSubgroup ≤ (N k).toSubgroup) ∧
      ∀ U : OpenNormalSubgroup G, ∃ k, (N k).toSubgroup ≤ U.toSubgroup :=
  sorry

/-- **Layer 3, rank sanity check.** The minimal number of generators of the finite `2`-group
`ℤ/4 × ℤ/2` is `2`, the Burnside-basis numerology (`G/Φ(G) ≅ (ℤ/2)²`) in its abstract
finite instance. -/
example : Group.rank (Multiplicative (ZMod 4) × Multiplicative (ZMod 2)) = 2 :=
  sorry

/-! ## Layer 4: free pro-`p` groups on finite sets, and abelian pro-`p` structure -/

/-- **Layer 4, `freeProP` is the free pro-`C` object at `C = ` finite `p`-groups.** The two
constructions agree, so that no statement has to choose between them. -/
example {p : ℕ} [Fact p.Prime] {X : Type u} :
    Nonempty (freeProC (finiteGroupClassP p) X ≃ₜ* freeProP p X) :=
  sorry

/-- **Layer 4, universal property of the free profinite group.** A map `X → G` into a
profinite group extends uniquely to a morphism of profinite groups out of
`freeProfiniteGroup X`. -/
theorem freeProfiniteGroup.existsUnique_lift (X : Type u) (G : ProfiniteGrp.{u}) (f : X → G) :
    ∃! φ : freeProfiniteGroup X ⟶ G, ∀ x : X, φ (freeProfiniteGroup.of x) = f x :=
  sorry

/-! ### The universal properties, pinned

⚠ These are the declarations downstream roadmaps consume, so they are **named theorems** and not
anonymous `example`s: `LocalGaloisGroups` and the Belyi successor cite them, and a consumer cannot
cite an `example`. Each object gets two, because consumers use two different forms. The `lift`
theorems are `∃!`, which is the universal property itself; the `hom_ext` theorems are the
extensionality form — two morphisms that agree on the generators are equal — which is what a proof
that two constructions coincide actually applies. `freeProfiniteGroup.lift` is stated above, with
the free profinite object.

For the two presented objects the universal property is the one a quotient has: a morphism out of
the free object that kills the relators factors uniquely through the projection. That is the form
Layer 5's non-vacuity argument for `D₀` uses, and the form the Iwasawa presentation in
`LocalFieldsRamification` Layer 4 consumes. -/

/-- **Layer 4, the lift itself.** ⚠ `existsUnique_lift` is the universal property, but a consumer
cannot *apply* an `∃!`: it has no name for the map. This is the map, and `lift_of` and
`lift_unique` are its two characterising equations. Together they are the supplier contract —
a carrier called "free" with no usable `lift` is not one. -/
noncomputable def freeProfiniteGroup.lift {X : Type u} (G : ProfiniteGrp.{u}) (f : X → G) :
    freeProfiniteGroup X ⟶ G :=
  sorry

/-- **Layer 4, the computation rule.** -/
theorem freeProfiniteGroup.lift_of {X : Type u} (G : ProfiniteGrp.{u}) (f : X → G) (x : X) :
    freeProfiniteGroup.lift G f (freeProfiniteGroup.of x) = f x :=
  sorry

/-- **Layer 4, the uniqueness rule.** -/
theorem freeProfiniteGroup.lift_unique {X : Type u} (G : ProfiniteGrp.{u}) (f : X → G)
    (φ : freeProfiniteGroup X ⟶ G) (hφ : ∀ x : X, φ (freeProfiniteGroup.of x) = f x) :
    φ = freeProfiniteGroup.lift G f :=
  sorry

/-- **Layer 4, the lift out of the free pro-`p` group**, with the pro-`p` hypothesis on the target
visible in the type. -/
noncomputable def freeProP.lift {p : ℕ} {X : Type u} {P : Type v} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] (hP : IsProP p P)
    (m : X → P) : freeProP p X →* P :=
  sorry

/-- **Layer 4.** The pro-`p` lift is continuous. ⚠ A separate statement: `→*` carries no
continuity, so a consumer that needs it must be able to cite it. -/
theorem freeProP.lift_continuous {p : ℕ} {X : Type u} {P : Type v} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] (hP : IsProP p P)
    (m : X → P) : Continuous (freeProP.lift hP m) :=
  sorry

/-- **Layer 4, the computation rule for the pro-`p` lift.** -/
theorem freeProP.lift_of {p : ℕ} {X : Type u} {P : Type v} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] (hP : IsProP p P)
    (m : X → P) (x : X) : freeProP.lift hP m (freeProP.of p x) = m x :=
  sorry

/-- **Layer 4, the uniqueness rule for the pro-`p` lift.** -/
theorem freeProP.lift_unique {p : ℕ} {X : Type u} {P : Type v} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] (hP : IsProP p P)
    (m : X → P) (f : freeProP p X →* P) (hfc : Continuous f)
    (hf : ∀ x : X, f (freeProP.of p x) = m x) : f = freeProP.lift hP m :=
  sorry

/-- **Layer 5, the factorisation through a presented profinite group**, given a morphism out of
the free object that kills the relators. -/
noncomputable def presentedProfiniteGroup.lift {X : Type u} (rels : Set (freeProfiniteGroup X))
    {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [T2Space G] [TotallyDisconnectedSpace G] (ψ : freeProfiniteGroup X →* G)
    (hψc : Continuous ψ) (hψ : ∀ r ∈ rels, ψ r = 1) :
    presentedProfiniteGroup X rels →* G :=
  sorry

/-- **Layer 5, the computation rule: the factorisation recovers `ψ`.** -/
theorem presentedProfiniteGroup.lift_mk {X : Type u} (rels : Set (freeProfiniteGroup X))
    {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [T2Space G] [TotallyDisconnectedSpace G] (ψ : freeProfiniteGroup X →* G)
    (hψc : Continuous ψ) (hψ : ∀ r ∈ rels, ψ r = 1) :
    (presentedProfiniteGroup.lift rels ψ hψc hψ).comp (presentedProfiniteGroup.mk rels) = ψ :=
  sorry

/-- **Layer 5, the uniqueness rule.** -/
theorem presentedProfiniteGroup.lift_unique {X : Type u} (rels : Set (freeProfiniteGroup X))
    {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [T2Space G] [TotallyDisconnectedSpace G] (ψ : freeProfiniteGroup X →* G)
    (hψc : Continuous ψ) (hψ : ∀ r ∈ rels, ψ r = 1)
    (φ : presentedProfiniteGroup X rels →* G)
    (hφ : φ.comp (presentedProfiniteGroup.mk rels) = ψ) :
    φ = presentedProfiniteGroup.lift rels ψ hψc hψ :=
  sorry

/-- **Layer 5, the factorisation through a presented pro-`p` group.** -/
noncomputable def presentedProP.lift {p : ℕ} {X : Type u} (rels : Set (freeProP p X))
    {P : Type u} [Group P] [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P]
    [T2Space P] [TotallyDisconnectedSpace P] (hP : IsProP p P) (ψ : freeProP p X →* P)
    (hψc : Continuous ψ) (hψ : ∀ r ∈ rels, ψ r = 1) :
    presentedProP p X rels →* P :=
  sorry

/-- **Layer 5, the computation rule for the pro-`p` factorisation.** -/
theorem presentedProP.lift_mk {p : ℕ} {X : Type u} (rels : Set (freeProP p X))
    {P : Type u} [Group P] [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P]
    [T2Space P] [TotallyDisconnectedSpace P] (hP : IsProP p P) (ψ : freeProP p X →* P)
    (hψc : Continuous ψ) (hψ : ∀ r ∈ rels, ψ r = 1) :
    (presentedProP.lift rels hP ψ hψc hψ).comp (presentedProP.mk p rels) = ψ :=
  sorry

/-- **Layer 4, uniqueness on generators for the free profinite group.** The extensionality form of
`freeProfiniteGroup.lift`. -/
theorem freeProfiniteGroup.hom_ext {X : Type u} {G : ProfiniteGrp.{u}}
    {φ ψ : freeProfiniteGroup X ⟶ G}
    (h : ∀ x : X, φ (freeProfiniteGroup.of x) = ψ (freeProfiniteGroup.of x)) :
    φ = ψ :=
  sorry

/-- **Layer 4, universal property of the free pro-`C` group.** A map `X → P` into a pro-`C` group
extends uniquely to a continuous homomorphism out of `freeProC C X`. -/
theorem freeProC.existsUnique_lift {C : FiniteGroupClass.{u}} {X : Type u} {P : Type u} [Group P]
    [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P] [T2Space P]
    [TotallyDisconnectedSpace P] (_hP : IsProC C P) (m : X → P) :
    ∃! f : freeProC C X →* P, Continuous f ∧ ∀ x : X, f (freeProC.of x) = m x :=
  sorry

/-- **Layer 4, uniqueness on generators for the free pro-`C` group.** ⚠ No pro-`C` hypothesis on
the target: two continuous homomorphisms agreeing on a topologically generating set agree, and
that needs only a Hausdorff target. -/
theorem freeProC.hom_ext {C : FiniteGroupClass.{u}} {X : Type u} {P : Type u} [Group P]
    [TopologicalSpace P] [IsTopologicalGroup P] [T2Space P] {f g : freeProC C X →* P}
    (hf : Continuous f) (hg : Continuous g)
    (h : ∀ x : X, f (freeProC.of x) = g (freeProC.of x)) :
    f = g :=
  sorry

/-- **Layer 4, universal property of the free pro-`p` group.** Maps from `X` into a pro-`p`
profinite group extend uniquely to continuous homomorphisms from `freeProP p X`. -/
theorem freeProP.existsUnique_lift {p : ℕ} {X : Type u} {P : Type v} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [CompactSpace P] [TotallyDisconnectedSpace P] (_hP : IsProP p P)
    (m : X → P) :
    ∃! f : freeProP p X →* P, Continuous f ∧ ∀ x : X, f (freeProP.of p x) = m x :=
  sorry

/-- **Layer 4, uniqueness on generators for the free pro-`p` group.** -/
theorem freeProP.hom_ext {p : ℕ} {X : Type u} {P : Type v} [Group P] [TopologicalSpace P]
    [IsTopologicalGroup P] [T2Space P] {f g : freeProP p X →* P}
    (hf : Continuous f) (hg : Continuous g)
    (h : ∀ x : X, f (freeProP.of p x) = g (freeProP.of p x)) :
    f = g :=
  sorry

/-- **Layer 5, universal property of a presented profinite group.** A continuous morphism out of
the free profinite group that kills every relator factors uniquely through the projection.
⚠ The relators are killed, not merely sent into a normal subgroup, and the factorisation is
through `presentedProfiniteGroup.mk`; the quotient is by the **closed** normal closure, which is
what keeps the target profinite. -/
theorem presentedProfiniteGroup.existsUnique_lift {X : Type u} (rels : Set (freeProfiniteGroup X))
    {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [T2Space G] [TotallyDisconnectedSpace G] (ψ : freeProfiniteGroup X →* G)
    (_hψc : Continuous ψ) (_hψ : ∀ r ∈ rels, ψ r = 1) :
    ∃! φ : presentedProfiniteGroup X rels →* G,
      Continuous φ ∧ φ.comp (presentedProfiniteGroup.mk rels) = ψ :=
  sorry

/-- **Layer 5, uniqueness for a presented profinite group.** -/
theorem presentedProfiniteGroup.hom_ext {X : Type u} {rels : Set (freeProfiniteGroup X)}
    {G : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [T2Space G]
    {φ ψ : presentedProfiniteGroup X rels →* G}
    (h : φ.comp (presentedProfiniteGroup.mk rels) = ψ.comp (presentedProfiniteGroup.mk rels)) :
    φ = ψ :=
  sorry

/-- **Layer 5, universal property of a presented pro-`p` group.** ⚠ Distinct from the profinite
one: the free object is already the pro-`p` one, so the targets are pro-`p` groups and the
statement forgets the prime-to-`p` part that `presentedProfiniteGroup` retains. -/
theorem presentedProP.existsUnique_lift {p : ℕ} {X : Type u} (rels : Set (freeProP p X))
    {P : Type u} [Group P] [TopologicalSpace P] [IsTopologicalGroup P] [CompactSpace P]
    [T2Space P] [TotallyDisconnectedSpace P] (_hP : IsProP p P) (ψ : freeProP p X →* P)
    (_hψc : Continuous ψ) (_hψ : ∀ r ∈ rels, ψ r = 1) :
    ∃! φ : presentedProP p X rels →* P,
      Continuous φ ∧ φ.comp (presentedProP.mk p rels) = ψ :=
  sorry

/-- **Layer 5, uniqueness for a presented pro-`p` group.** -/
theorem presentedProP.hom_ext {p : ℕ} {X : Type u} {rels : Set (freeProP p X)}
    {P : Type u} [Group P] [TopologicalSpace P] [IsTopologicalGroup P] [T2Space P]
    {φ ψ : presentedProP p X rels →* P}
    (h : φ.comp (presentedProP.mk p rels) = ψ.comp (presentedProP.mk p rels)) :
    φ = ψ :=
  sorry

/-- **Layer 4, topological finite generation of free pro-`p` groups.** The free pro-`p`
group on a finite set is topologically finitely generated (by the images of the free
generators, which are dense-generating by construction). -/
example {p : ℕ} {X : Type u} [Finite X] : IsTopologicallyFinitelyGenerated (freeProP p X) :=
  sorry

/-- **Layer 4, the rank of a free pro-`p` group on a finite set.** The natural-number form
for `Fin n` is a corollary through the accessor. Finiteness of `X` is a hypothesis, not a
convenience: `freeProP p S` for infinite discrete `S` has rank `p ^ #S`, not `#S`, which is
why the infinite-rank free objects are built on a profinite space in Layer 10. -/
example {p : ℕ} [Fact p.Prime] {X : Type u} [Finite X] :
    topologicalGeneratorRank (freeProP p X) = Cardinal.mk X :=
  sorry

/-- **Layer 4, free groups are residually `p`.** The canonical map from the discrete free
group to the free pro-`p` group is injective: the classical residual `p`-finiteness of free
groups, and the reason the generators of `freeProP` behave like free generators. -/
example {p : ℕ} [Fact p.Prime] {X : Type u} :
    Function.Injective ((QuotientGroup.mk' (proPKernel p (freeProfiniteGroup X))).comp
      (ProfiniteGrp.ProfiniteCompletion.eta (GrpCat.of (FreeGroup X))).hom) :=
  sorry

/-- **Layer 4, the maximal pro-`p` quotient of `ℤ̂` is `ℤ_p`.** Step (1)–(2) of the
identification chain, and the statement the Layer 2 `ℤ̂`-Sylow example rests on. -/
theorem maximalProPQuotient_zHat_equiv_padicInt (p : ℕ) [Fact p.Prime] :
    Nonempty (maximalProPQuotient p zHat ≃ₜ* Multiplicative ℤ_[p]) :=
  sorry

/-- **Layer 4, the rank-one free pro-`p` group is `ℤ_p`.** Step (3): both objects represent
the same functor on pro-`p` profinite groups, so the free object's uniqueness gives the
isomorphism. This is what every later `ℤ_p`-coefficient argument cites. -/
example (p : ℕ) [Fact p.Prime] :
    Nonempty (freeProP p (Fin 1) ≃ₜ* Multiplicative ℤ_[p]) :=
  sorry

/-- **Layer 4, exponentiation by `ℤ_p` in an abelian pro-`p` group.** The continuous action
obtained as the inverse limit of exponentiation in the finite abelian `p`-quotients; it is
what makes an abelian pro-`p` group a topological `ℤ_p`-module. -/
example (p : ℕ) [Fact p.Prime] {A : Type u} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A] (hA : IsProP p A) :
    ∃ e : ℤ_[p] → A → A, Continuous (fun x : ℤ_[p] × A ↦ e x.1 x.2) ∧
      (∀ a, e 1 a = a) ∧ (∀ (l m : ℤ_[p]) (a : A), e (l * m) a = e l (e m a)) ∧
      (∀ (l m : ℤ_[p]) (a : A), e (l + m) a = e l a * e m a) ∧
      ∀ (n : ℕ) (a : A), e (n : ℤ_[p]) a = a ^ n :=
  sorry

/-- **Layer 4, the structure theorem for finitely generated abelian pro-`p` groups.**
`A ≅ ℤ_p^r × T` with `T` a finite abelian `p`-group; uniqueness of `r` and of the elementary
divisors of `T` are separate statements. Layer 7's `q`-invariant is defined from `T`, so this
theorem is what makes `demushkinQ` well defined from `IsDemushkin` alone. -/
example (p : ℕ) [Fact p.Prime] {A : Type} [CommGroup A] [TopologicalSpace A]
    [IsTopologicalGroup A] [CompactSpace A] [TotallyDisconnectedSpace A] (hA : IsProP p A)
    (hfg : IsTopologicallyFinitelyGenerated A) :
    ∃ (r m : ℕ) (e : Fin m → ℕ),
      Nonempty (A ≃ₜ*
        Multiplicative ((Fin r → ℤ_[p]) × ((i : Fin m) → ZMod (p ^ e i)))) :=
  sorry

/-! ## Layer 5: presentations -/

/-- **Layer 5, a continuous section along a finite kernel.** The lemma the cocycle side of
the extension dictionary runs on, in the only case it is used: `N` finite, `E ⧸ N` possibly
infinite. Proof: an open normal `U ≤ E` with `U ⊓ N = ⊥` maps isomorphically onto an open
subgroup of `E ⧸ N`, and finitely many coset translates of that section give a section over a
clopen partition. ⚠ The corresponding statement for an arbitrary surjection of profinite
*spaces* is false, so nothing here appeals to one. -/
example {E : Type u} [Group E] [TopologicalSpace E] [IsTopologicalGroup E] [CompactSpace E]
    [TotallyDisconnectedSpace E] (N : Subgroup E) [N.Normal] (hN : Finite N) :
    ∃ s : E ⧸ N → E, Continuous s ∧ (∀ x, (QuotientGroup.mk (s x) : E ⧸ N) = x) ∧ s 1 = 1 :=
  sorry

/-- **Layer 5, the map that proves `D₀` is nontrivial.** Not "map onto some finite
`2`-group": the map is the one sending `A ↦ 1`, `S ↦` the generator of `ℤ/2`, `Y ↦ 1`. The
relator `A²S⁴(S,Y)` maps to `2·0 + 4·1 = 0`, so it factors through `D₀`, and the induced map
is surjective because `S` already hits the generator. -/
example : ∃ φ : freeProP 2 (Fin 3) →* Multiplicative (ZMod 2),
    Continuous φ ∧ φ (freeProP.of 2 0) = 1 ∧
      φ (freeProP.of 2 1) = Multiplicative.ofAdd 1 ∧ φ (freeProP.of 2 2) = 1 ∧
      φ d0Relator = 1 ∧ Function.Surjective φ :=
  sorry

/-- **Layer 5, the induced surjection `D₀ ↠ ℤ/2`.** -/
example : ∃ f : demushkinD0 →* Multiplicative (ZMod 2),
    Continuous f ∧ Function.Surjective f :=
  sorry

/-- **Layer 5, non-vacuity of the presentation machinery.** `D₀` is nontrivial, a corollary
of the surjection above. -/
example : Nontrivial demushkinD0 :=
  sorry

/-- **Layer 5, presented groups are pro-`p`.** The presentation construction lands in
pro-`2` groups: `D₀` is pro-`2`, and topologically finitely generated. -/
example : IsProP 2 demushkinD0 ∧ IsTopologicallyFinitelyGenerated demushkinD0 :=
  sorry

/-! ### The marked standard presentation `D₀`

`D₀` is a *presented* group, so its three generators are named terms and its orientation is a
named character with named values. These are the abstract marked data exported to downstream
consumers. -/

/-- The marked generator `A` of `D₀`, the image of the first free pro-`2` generator. -/
noncomputable def d0A : demushkinD0 := QuotientGroup.mk (freeProP.of 2 0)

/-- The marked generator `S` of `D₀`, the image of the second free pro-`2` generator. -/
noncomputable def d0S : demushkinD0 := QuotientGroup.mk (freeProP.of 2 1)

/-- The marked generator `Y` of `D₀`, the image of the third free pro-`2` generator. -/
noncomputable def d0Y : demushkinD0 := QuotientGroup.mk (freeProP.of 2 2)

/-- **Layer 5, the marked generators generate.** `A`, `S` and `Y` topologically generate `D₀`,
which is what makes a continuous character determined by its values on them. -/
theorem d0_topologicallyGenerates :
    (Subgroup.closure ({d0A, d0S, d0Y} : Set demushkinD0)).topologicalClosure = ⊤ :=
  sorry

/-- **Layer 7, `-3` is a `2`-adic unit.** The value `χ(Y) = (-3)⁻¹` of the standard orientation
is the inverse of this unit, so the unit is named rather than written as a literal. -/
theorem isUnit_neg_three : IsUnit (-3 : ℤ_[2]) := sorry

/-- The `2`-adic unit with value `-3`. -/
noncomputable abbrev negThreeUnit : ℤ_[2]ˣ := isUnit_neg_three.unit

/-- **Layer 7, the value of `negThreeUnit`.** -/
theorem negThreeUnit_coe : (negThreeUnit : ℤ_[2]) = -3 := isUnit_neg_three.unit_spec

/-- **The standard orientation of `D₀`**, the continuous character `D₀ → ℤ₂ˣ` with values
`(-1, 1, (-3)⁻¹)` on `(A, S, Y)`. It exists because those values kill the relator
`A²S⁴(S, Y)`: the relator maps to `(-1)² · 1⁴ · 1 = 1`, the commutator dying because `ℤ₂ˣ` is
abelian. It is data, so it is a `def`, and the value theorems below are what pin it. -/
noncomputable def standardD0Orientation : demushkinD0 →* ℤ_[2]ˣ := sorry

/-- **Layer 7, `χ(A) = -1`.** -/
theorem standardD0Orientation_d0A : standardD0Orientation d0A = -1 := sorry

/-- **Layer 7, `χ(S) = 1`.** -/
theorem standardD0Orientation_d0S : standardD0Orientation d0S = 1 := sorry

/-- **Layer 7, `χ(Y) = (-3)⁻¹`.** In the notation of the Layer 9 character table this is
`(1 - 2²)⁻¹` at `f = 2`. -/
theorem standardD0Orientation_d0Y : standardD0Orientation d0Y = negThreeUnit⁻¹ := sorry

/-- **Layer 7, the standard orientation is continuous.** -/
theorem standardD0Orientation_continuous : Continuous standardD0Orientation := sorry

/-- **Layer 7, the standard orientation is surjective**, so its image is all of `ℤ₂ˣ`. This is
the `Im χ = ℤ₂ˣ` half of the acceptance instance, and it is a computation with the values
above: `-1` and `-3` topologically generate `ℤ₂ˣ`. -/
theorem standardD0Orientation_surjective : Function.Surjective standardD0Orientation := sorry

/-- **Layer 7, the standard orientation is the only continuous character with those values.**
The marked generators topologically generate `D₀`, so a continuous character is determined by
its values on them. This is what makes the marked acceptance instance a normalization and not a
choice. -/
theorem standardD0Orientation_unique (ψ : demushkinD0 →* ℤ_[2]ˣ) (hψ : Continuous ψ)
    (hA : ψ d0A = -1) (hS : ψ d0S = 1) (hY : ψ d0Y = negThreeUnit⁻¹) :
    ψ = standardD0Orientation :=
  sorry

/-- **Layer 7, the standard orientation kills the relator.** The compatibility that makes the
character descend from the free pro-`2` group to `D₀`, written on the relator word itself. -/
theorem standardD0Orientation_relator (φ : freeProP 2 (Fin 3) →* ℤ_[2]ˣ)
    (hA : φ (freeProP.of 2 0) = -1) (hS : φ (freeProP.of 2 1) = 1)
    (hY : φ (freeProP.of 2 2) = negThreeUnit⁻¹) : φ d0Relator = 1 :=
  sorry

/-! ### Layer 5: finite embedding problems and projectivity

The route from the extension dictionary to projectivity is six statements, not one. Each is named
below, so that a reader can see which step a proof is at and the dependency graph is closed:
the embedding problem itself; solvability when the kernel is elementary abelian, which is the
step `H²` vanishing feeds; the lower `p`-central reduction of a `p`-group kernel to a chain of
those; solvability with `p`-group kernel; the level-`U` problems and their solution sets; and the
inverse-limit lifting that turns compatible finite solutions into projectivity.

⚠ Continuity of a homomorphism into a **finite discrete** group is openness of its kernel, and
that is how it is written here — the same convention `OccursAsFiniteQuotient` uses, and the reason
no field of the problem below carries a topology. -/

/-- **Layer 5, a finite embedding problem** for a profinite `G`: a continuous surjection
`π : G ↠ Q` onto a finite group together with a surjection `α : E ↠ Q` of finite groups. -/
structure FiniteEmbeddingProblem (G : Type u) [Group G] [TopologicalSpace G] where
  /-- The finite quotient of `G` the problem sits over. -/
  Q : Type u
  [groupQ : Group Q]
  [finiteQ : Finite Q]
  /-- The finite group the solution must land in. -/
  E : Type u
  [groupE : Group E]
  [finiteE : Finite E]
  /-- The continuous surjection `G ↠ Q`. -/
  π : G →* Q
  /-- Continuity of `π`, as openness of its kernel. -/
  π_ker_isOpen : IsOpen (π.ker : Set G)
  π_surjective : Function.Surjective π
  /-- The surjection of finite groups. -/
  α : E →* Q
  α_surjective : Function.Surjective α

attribute [instance] FiniteEmbeddingProblem.groupQ FiniteEmbeddingProblem.finiteQ
  FiniteEmbeddingProblem.groupE FiniteEmbeddingProblem.finiteE

/-- **Layer 5, a solution** of a finite embedding problem: a continuous `β : G → E` over `π`.
⚠ Nothing here asks `β` to be surjective, and no theorem below makes it so. With `G = C_p`,
`Q = 1` and `E = C_p × C_p` the unique maps form an embedding problem all of whose solutions miss
a generator; projectivity needs only this weak form. -/
def FiniteEmbeddingProblem.IsSolution {G : Type u} [Group G] [TopologicalSpace G]
    (P : FiniteEmbeddingProblem G) (β : G →* P.E) : Prop :=
  IsOpen (β.ker : Set G) ∧ ∀ g : G, P.α (β g) = P.π g

/-- **Layer 5.1, solvability with elementary abelian kernel**, the step the vanishing of `H²`
feeds. `ker α` is elementary abelian and centralized by itself, so conjugation makes it a
`Q`-module, and the class of the extension in `H²(G, ker α)` is the obstruction. -/
def HasElementaryAbelianSolutions (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] : Prop :=
  ∀ P : FiniteEmbeddingProblem G, IsPGroup p P.α.ker → (∀ x : P.α.ker, x ^ p = 1) →
    (∀ x : P.α.ker, ∀ y : P.α.ker, x * y = y * x) → ∃ β : G →* P.E, P.IsSolution β

/-- **Layer 5.3, solvability with `p`-group kernel**, the conclusion of the induction below. -/
def HasPGroupSolutions (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] : Prop :=
  ∀ P : FiniteEmbeddingProblem G, IsPGroup p P.α.ker → ∃ β : G →* P.E, P.IsSolution β

/-- **Layer 5.2, the lower `p`-central reduction.** A `p`-group kernel `N = ker α` is filtered by
`λ_0(N) = N`, `λ_{k+1}(N) = λ_k(N)^p [λ_k(N), N]`, which reaches `1` in finitely many steps and
whose factors are elementary abelian. ⚠ Each `λ_k(N)` is **characteristic** in `N`, hence normal
in `E`; that is what makes the factors `Q`-modules and the reduction work. An arbitrary central
series of `N` need not be stable under conjugation by `E`. -/
theorem exists_pLowerCentral_filtration_of_isPGroup {p : ℕ} [Fact p.Prime] {E : Type u} [Group E]
    [Finite E] (N : Subgroup E) [N.Normal] (_hN : IsPGroup p N) :
    ∃ (m : ℕ) (lam : ℕ → Subgroup E), lam 0 = N ∧ lam m = ⊥ ∧
      (∀ k, lam (k + 1) ≤ lam k) ∧ (∀ k, (lam k).Normal) ∧
      (∀ k, ∀ x ∈ lam k, x ^ p ∈ lam (k + 1)) ∧
      ∀ k, ∀ x ∈ lam k, ∀ y ∈ N, x * y * x⁻¹ * y⁻¹ ∈ lam (k + 1) :=
  sorry

/-- **Layer 5.3, the induction.** Solvability for elementary abelian kernels gives solvability for
`p`-group kernels, one step of the filtration at a time. This is the only place the filtration is
used, and it is why 5.2 is a separate milestone rather than a line of the proof. -/
theorem hasPGroupSolutions_of_hasElementaryAbelianSolutions {p : ℕ} [Fact p.Prime] {G : Type u}
    [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] (_h : HasElementaryAbelianSolutions p G) :
    HasPGroupSolutions p G :=
  sorry

/-- **Layer 5.4, the level-`U` embedding problem.** For a surjection `α : A ↠ B` of pro-`p` groups
and a continuous `f : G →* B`, each open normal `U ≤ A` cuts out a finite embedding problem for
`G`: take `E = A ⧸ U` and `Q = B ⧸ α(U)`. Its solutions are the level-`U` approximate lifts, and
they are the sets the compactness lemma is applied to. -/
noncomputable def levelProblem {p : ℕ} {G A B : Type u} [Group G] [TopologicalSpace G]
    [Group A] [TopologicalSpace A] [IsTopologicalGroup A] [CompactSpace A]
    [TotallyDisconnectedSpace A] [Group B] [TopologicalSpace B] [IsTopologicalGroup B]
    [CompactSpace B] [TotallyDisconnectedSpace B] (_hA : IsProP p A) (_hB : IsProP p B)
    (α : A →* B) (_hαc : Continuous α) (_hα : Function.Surjective α)
    (f : G →* B) (_hf : Continuous f) (U : OpenNormalSubgroup A) :
    FiniteEmbeddingProblem G :=
  sorry

/-- **Layer 5.5, compatible systems of finite solutions.** Every level problem is solvable, its
solution set is nonempty and finite, and the transition maps between levels are surjective.
⚠ Nonemptiness level by level is not enough on its own: what the Layer 0 compactness lemma needs
is a **directed family of nonempty closed** subsets, which is why finiteness of each level and
surjectivity of the transitions are part of this milestone and not asides. -/
theorem nonempty_isSolution_levelProblem {p : ℕ} [Fact p.Prime] {G A B : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    [Group A] [TopologicalSpace A] [IsTopologicalGroup A] [CompactSpace A]
    [TotallyDisconnectedSpace A] [Group B] [TopologicalSpace B] [IsTopologicalGroup B]
    [CompactSpace B] [TotallyDisconnectedSpace B] (hA : IsProP p A) (hB : IsProP p B)
    (α : A →* B) (hαc : Continuous α) (hα : Function.Surjective α)
    (f : G →* B) (hf : Continuous f) (_hG : HasPGroupSolutions p G) (U : OpenNormalSubgroup A) :
    ∃ β : G →* (levelProblem hA hB α hαc hα f hf U).E,
      (levelProblem hA hB α hαc hα f hf U).IsSolution β :=
  sorry

/-- **Layer 5.6, projectivity**: every continuous map to a pro-`p` quotient lifts. -/
def IsProjective (p : ℕ) (G : Type u) [Group G] [TopologicalSpace G] : Prop :=
  ∀ (A B : Type u) [Group A] [TopologicalSpace A] [IsTopologicalGroup A] [CompactSpace A]
    [TotallyDisconnectedSpace A] [Group B] [TopologicalSpace B] [IsTopologicalGroup B]
    [CompactSpace B] [TotallyDisconnectedSpace B],
    IsProP p A → IsProP p B →
      ∀ α : A →* B, Continuous α → Function.Surjective α →
        ∀ f : G →* B, Continuous f →
          ∃ β : G →* A, Continuous β ∧ α.comp β = f

/-- **Layer 5.6, inverse-limit lifting.** The compatible finite solutions of 5.5 assemble to a
continuous lift, by the Layer 0 compactness lemma applied to the level solution sets. This is the
projectivity statement Layer 6 consumes; `cd_p G ≤ 1` enters through 5.1. -/
theorem isProjective_of_hasPGroupSolutions {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (_hG : HasPGroupSolutions p G) :
    IsProjective p G :=
  sorry

/-- **Layer 5.7, the converse.** A projective group solves every finite embedding problem with
`p`-group kernel: a finite embedding problem *is* a lifting problem against the surjection
`E ↠ Q` of finite — hence pro-`p`, when the kernel is a `p`-group — groups. -/
theorem hasPGroupSolutions_of_isProjective {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (_hG : IsProjective p G) :
    HasPGroupSolutions p G :=
  sorry

/-- **Layer 5.7, the equivalence with topological projectivity.** The two formulations agree, so
a consumer may use whichever is convenient and Layer 6 may quote either.
⚠ This is the step at which an abstract finite-group argument would silently replace the required
continuous profinite one: the right-to-left direction is finite-level bookkeeping, but
left-to-right is the inverse limit of 5.5–5.6 and is not formal. -/
theorem isProjective_iff_hasPGroupSolutions {p : ℕ} [Fact p.Prime] {G : Type u} [Group G]
    [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] :
    IsProjective p G ↔ HasPGroupSolutions p G :=
  ⟨hasPGroupSolutions_of_isProjective, isProjective_of_hasPGroupSolutions⟩

/-! ## Layer 6: cohomological dimension, and its Nielsen-Schreier consequence

`cd_p` is the imported `ProfiniteCohomology.cd_p`: the infimum, in `ℕ∞`, of the `n` for which
`Hⁱ(G, M)` vanishes above `n` for every discrete `p`-primary torsion `M`. This roadmap defines
no second cohomological dimension. The two general reductions, to finite coefficients and to
coefficients of bounded exponent, are `ProfiniteCohomology.cd_p_le_iff_finite_pPrimary` and
`ProfiniteCohomology.cd_p_le_iff_boundedExponent`; the pro-`p` reduction below is the third and
is owned here. -/

section CohomologicalDimension

variable (p : ℕ) [Fact p.Prime]

/-- **Layer 6, the pro-`p` reduction of `cd_p`.** For a pro-`p` group it is enough to test the
single module `𝔽_p` with trivial action: the two hypotheses on `M` below say that `M` is finite,
killed by `p` and acted on trivially, which makes it a finite direct sum of copies of `𝔽_p`.
Route: the trivial-filtration theorem of this layer, which for a pro-`p` group filters any
finite discrete `p`-primary module with factors `𝔽_p`, and the long exact sequences of the
imported carrier. ⚠ This equivalence is a reduction and not the definition: writing the
elementary abelian test as the definition would make the dévissage vacuous. -/
theorem cd_p_le_iff_elementaryAbelian_of_isProP (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    (n : ℕ) :
    ProfiniteCohomology.cd_p p G ≤ (n : ℕ∞) ↔
      ∀ (M : Type u) [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M]
        [DiscreteTopology M] [DistribMulAction G M] [ContinuousSMul G M] [Finite M],
        (∀ m : M, p • m = 0) → (∀ (g : G) (m : M), g • m = m) →
          Limits.IsZero (_root_.continuousCohomology (n + 1)
            (ProfiniteCohomology.ofDiscreteModule G M)) :=
  sorry

/-- **Layer 6, the trivial-filtration theorem.** For pro-`p` `G`, a nonzero finite discrete
`p`-primary `G`-module has nonzero invariants, because the action factors through a finite
`p`-quotient. Iterating gives the `G`-stable filtration with one-dimensional trivial factors
that the dévissage above runs on. ⚠ Do not write `dim_{𝔽_p} M` here: `ℤ/p²` is a finite
`p`-primary module that is not an `𝔽_p`-vector space. -/
theorem exists_ne_zero_invariant_of_isProP (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    (M : Type u) [AddCommGroup M] [TopologicalSpace M] [DiscreteTopology M]
    [DistribMulAction G M] [ContinuousSMul G M] [Finite M] (hM : Nontrivial M)
    (htors : ∀ m : M, ∃ k : ℕ, (p ^ k) • m = 0) :
    ∃ m : M, m ≠ 0 ∧ ∀ g : G, g • m = m :=
  sorry

/-- **Layer 6, free implies `cd_p ≤ 1`.** Layer 5's vanishing theorem `H²(F, M) = 0`, restated
against the imported `cd_p`. Dévissage changes the coefficients and the degree-raising theorem
changes the degree, so the proof needs both. -/
theorem cd_p_freeProP_le_one (n : ℕ) [TotallyDisconnectedSpace (freeProP p (Fin n))] :
    ProfiniteCohomology.cd_p p (freeProP p (Fin n)) ≤ 1 :=
  sorry

/-- **Layer 6, Serre's theorem**: `cd_p G ≤ 1` implies free pro-`p`, for topologically finitely
generated `G`. The route is projectivity, a minimal presentation, a homomorphic section, and
Burnside. ⚠ The version without finite generation is a different theorem with a different
proof, and it is Layer 10's. -/
theorem isFree_of_cd_p_le_one (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G)
    (hfg : IsTopologicallyFinitelyGenerated G) (hcd : ProfiniteCohomology.cd_p p G ≤ 1)
    [TotallyDisconnectedSpace (freeProP p (Fin (topologicalGeneratorRankNat G hfg)))] :
    Nonempty (G ≃ₜ* freeProP p (Fin (topologicalGeneratorRankNat G hfg))) :=
  sorry

/-- **Layer 6, `cd_p` of an open subgroup.** For `U` open in pro-`p` `G` with `cd_p G` finite,
`cd_p U = cd_p G`. ⚠ The imported `cd_p_eq_of_index_not_dvd` is the prime-to-`p`-index case and
does not cover an open subgroup of index divisible by `p`, which is the case used here. -/
theorem cd_p_eq_of_isOpen (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (hG : IsProP p G) (U : OpenSubgroup G)
    (hfin : ProfiniteCohomology.cd_p p G ≠ ⊤)
    [CompactSpace U.toSubgroup] [TotallyDisconnectedSpace U.toSubgroup] :
    ProfiniteCohomology.cd_p p U.toSubgroup = ProfiniteCohomology.cd_p p G :=
  sorry

/-- **Layer 6, the Sylow equality** `cd_p G = cd_p G_p`, for `G` profinite and `G_p` a `p`-Sylow
subgroup from Layer 2. This is the one milestone of this layer about a group that need not be
pro-`p`. A `p`-Sylow subgroup is closed and in general **not** open, so the imported
`cd_p_eq_of_index_not_dvd`, which is the open prime-to-`p`-index case, gives only the open
subgroups above `G_p`; the colimit description of the cohomology of a closed subgroup, the
Sylow theory of Layer 2, and the imported closed-subgroup Shapiro are what turn those into the
equality. -/
theorem cd_p_eq_of_isProPSylow (G : Type u) [Group G] [TopologicalSpace G] [IsTopologicalGroup G]
    [CompactSpace G] [TotallyDisconnectedSpace G] (P : Subgroup G) (hP : IsProPSylow p P)
    [CompactSpace P] [TotallyDisconnectedSpace P] :
    ProfiniteCohomology.cd_p p P = ProfiniteCohomology.cd_p p G :=
  sorry

/-- **Layer 7, an infinite Demushkin group has `cd_p = 2`.** `≤ 2` from the one-relator
presentation and the imported five-term sequence; `≥ 2` from `dim H²(G, 𝔽_p) = 1`, which is part
of the definition. -/
theorem cd_p_eq_two_of_isDemushkin (G : Type u) [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G]
    (hG : IsDemushkin p G) (hinf : Infinite G) : ProfiniteCohomology.cd_p p G = 2 :=
  sorry

/-- **Layer 10, closed subgroups of free pro-`p` groups.** A closed subgroup of a free pro-`p`
group again has `cd_p ≤ 1`, by the imported monotonicity `cd_p_le_of_isClosed` and the free
case above; with Serre's theorem at arbitrary rank this is the full pro-`p` Nielsen-Schreier
theorem, whose free objects on a profinite space are Layer 10. -/
theorem cd_p_le_one_of_isClosed_freeProP (n : ℕ) [TotallyDisconnectedSpace (freeProP p (Fin n))]
    (H : Subgroup (freeProP p (Fin n))) (hH : IsClosed (H : Set (freeProP p (Fin n))))
    [CompactSpace H] [TotallyDisconnectedSpace H] :
    ProfiniteCohomology.cd_p p H ≤ 1 :=
  sorry

end CohomologicalDimension

/-! ## Layer 6: cohomological dimension, and its Nielsen–Schreier consequence -/

/-- **Layer 6, pro-`p` Nielsen–Schreier for open subgroups, with the index-rank formula.**
An open subgroup of index `m` in the free pro-`p` group of rank `n ≥ 1` is free pro-`p` of
rank `1 + m(n - 1)`. (Route pinned in `README.md`: via `cd ≤ 1` and the two-term Euler
formula, not a transversal argument. The natural-number subtraction `n - 1` is harmless under
`n ≠ 0`; the Euler formula itself is stated in `ℤ`.) -/
example {p : ℕ} [Fact p.Prime] {n : ℕ} (hn : n ≠ 0) (U : OpenSubgroup (freeProP p (Fin n))) :
    Nonempty (U ≃ₜ* freeProP p (Fin (1 + U.toSubgroup.index * (n - 1)))) :=
  sorry

/-! ## Layer 7: the closed subgroups of `ℤ₂ˣ`, and the abelianization-level invariants -/

/-- **Layer 7, the closed subgroups of `ℤ₂ˣ`: exhaustiveness.** Every nontrivial closed
subgroup is one of `U^(f)`, `{±1} × U^(f)`, `{±1}`, or Labute's `U^[f]`. Uniqueness of the
case and of `f` is the companion statement; the indices and the values of `(A : A²)` are the
numbers Layer 9's existence theorem quotes. -/
theorem closedSubgroup_units_two_trichotomy (A : Subgroup ℤ_[2]ˣ)
    (hA : IsClosed (A : Set ℤ_[2]ˣ)) (hA1 : A ≠ ⊥) :
    (∃ f : ℕ, 2 ≤ f ∧ A = unitsPrincipal f) ∨
      (∃ f : ℕ, 2 ≤ f ∧ A = unitsPlusMinus f) ∨
      A = Subgroup.closure {(-1 : ℤ_[2]ˣ)} ∨
      (∃ (f : ℕ) (u : ℤ_[2]ˣ),
        2 ≤ f ∧ (u : ℤ_[2]) = -1 + 2 ^ f ∧ A = procyclicClosure u) :=
  sorry

/-- **Layer 7, uniqueness of the case and of the level.** The four families of the trichotomy are
pairwise disjoint, and `f` is determined within each. ⚠ This is what a consumer needs in order to
speak of *the* level of an orientation image: `LocalGaloisGroups` computes the image of the
cyclotomic character and then reads `f` off it, which is only well defined given this. -/
theorem closedSubgroup_units_two_level_unique {f f' : ℕ} (hf : 2 ≤ f) (hf' : 2 ≤ f')
    (h : unitsPrincipal f = unitsPrincipal f') : f = f' :=
  sorry

/-- **Layer 7, the even part of `U^[f]`.** For `u = -1 + 2^f` with `f ≥ 2`, the square
`u² = 1 - 2^{f+1}(1 - 2^{f-1})` has principal-unit depth exactly `f + 1`, so
`U^[f] ∩ (1 + 4ℤ₂) = U^(f+1)` and hence `[ℤ₂ˣ : U^[f]] = 2^{f-1}`. Stated separately from
the trichotomy because a shift of one in this exponent reparametrizes the whole `q = 2`
classification; check it by hand at `f = 2, 3, 4`. -/
example (f : ℕ) (hf : 2 ≤ f) (u : ℤ_[2]ˣ) (hu : (u : ℤ_[2]) = -1 + 2 ^ f) :
    procyclicClosure u ⊓ unitsPrincipal 2 = unitsPrincipal (f + 1) :=
  sorry

/-- **Layer 7, procyclicity.** The closed subgroups of `ℤ₂ˣ` not containing `-1`, namely
the families `U^(f)` and `U^[f]`, are topologically generated by one element. `{±1} × U^(f)` is
not, for `f < ∞`: its Frattini quotient is `(ℤ/2)²`. -/
example (A : Subgroup ℤ_[2]ˣ) (hA : IsClosed (A : Set ℤ_[2]ˣ)) (h1 : (-1 : ℤ_[2]ˣ) ∉ A) :
    ∃ u : ℤ_[2]ˣ, procyclicClosure u = A :=
  sorry

/-- **Layer 7, the abelianization of `D₀`.** `D₀^{ab} ≅ ℤ₂ × ℤ₂ × ℤ/2` as topological
groups, so the relator `A²S⁴(S,Y)` abelianizes to `2A + 4S`, so the topological abelianization
is `ℤ₂³/⟨(2,4,0)⟩`. This is the computation behind `n = 3`, `q = 2`. -/
example :
    Nonempty (topAbelianization demushkinD0 ≃ₜ*
      Multiplicative (ℤ_[2] × ℤ_[2] × ZMod 2)) :=
  sorry

/-- **Layer 7, the `q`-invariant of `D₀`.** The torsion subgroup of `D₀^{ab} ≅ ℤ₂² × ℤ/2`
has two elements, so `q(D₀) = 2`. This is a computation with the presentation, and it does
not use the classification. -/
example : Nat.card {x : topAbelianization demushkinD0 // IsOfFinOrder x} = 2 :=
  sorry

/-! ## Layer 8: the lower `p`-series and finite-quotient determinacy -/

/-- **Layer 8, the lower `p`-series is closed, normal, and descending.** The basic API every
tower argument needs before it can quotient by a term. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] (k : ℕ) :
    IsClosed ((pLowerCentralSeries p G k : Subgroup G) : Set G) ∧
      (pLowerCentralSeries p G k).Normal ∧
      pLowerCentralSeries p G (k + 1) ≤ pLowerCentralSeries p G k :=
  sorry

/-- **Layer 8, functoriality of the lower `p`-series.** Continuous homomorphisms respect it,
and continuous surjections map each term *onto* the corresponding term. -/
example {p : ℕ} [Fact p.Prime] {G : Type u} [Group G] [TopologicalSpace G]
    [IsTopologicalGroup G] [CompactSpace G] [TotallyDisconnectedSpace G] {H : Type u}
    [Group H] [TopologicalSpace H] [IsTopologicalGroup H] [CompactSpace H]
    [TotallyDisconnectedSpace H] (f : G →* H) (hf : Continuous f) (k : ℕ) :
    (pLowerCentralSeries p G k).map f ≤ pLowerCentralSeries p H k ∧
      (Function.Surjective f → (pLowerCentralSeries p G k).map f
        = pLowerCentralSeries p H k) :=
  sorry

/-- **Layer 8, openness of the lower `p`-series.** In a topologically finitely generated
pro-`p` group every term of the lower `p`-series is open. (With cofinality below, the series
is then a neighborhood basis of `1` by finite `p`-quotients: the tower the comparison
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

/-- **Layer 8, occurring as a continuous quotient is an isomorphism invariant.** Both in the
finite group and in the profinite group: the two statements that let the reconstruction
theorem quantify over bundled finite groups. -/
example {G : Type u} [Group G] [TopologicalSpace G] {Q Q' : FiniteGrp.{v}} (e : Q ≃* Q') :
    IsFiniteContinuousQuotient G Q ↔ IsFiniteContinuousQuotient G Q' :=
  sorry

/-- **Layer 8, two epimorphisms.** If `G` is topologically finitely generated and `G` and `H`
have the same continuous finite quotients, there are continuous surjections in both
directions. This is the step where the finite-generation hypotheses are used; the theorem
below removes the one on `H`. -/
example {G H : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : IsTopologicallyFinitelyGenerated G)
    (h : ∀ Q : FiniteGrp.{u},
      IsFiniteContinuousQuotient G Q ↔ IsFiniteContinuousQuotient H Q) :
    (∃ f : G →* H, Continuous f ∧ Function.Surjective f) ∧
      ∃ g : H →* G, Continuous g ∧ Function.Surjective g :=
  sorry

/-- **Layer 8, finite-quotient determinacy, sharp form** (Fried–Jarden; RZ Thm. 3.2.9). Two
profinite groups with the same continuous finite quotients are topologically isomorphic as
soon as **one** of them is topologically finitely generated. Route: the two epimorphisms
above, then `ψ ∘ φ : G ↠ G` is an isomorphism by the Hopf property of Layer 3, so `φ` is a
continuous bijection of compact Hausdorff groups. Finite generation of `H` is a conclusion,
not a hypothesis. -/
example {G H : Type u} [Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G]
    [TotallyDisconnectedSpace G] [Group H] [TopologicalSpace H] [IsTopologicalGroup H]
    [CompactSpace H] [TotallyDisconnectedSpace H]
    (hG : IsTopologicallyFinitelyGenerated G)
    (h : ∀ Q : FiniteGrp.{u},
      IsFiniteContinuousQuotient G Q ↔ IsFiniteContinuousQuotient H Q) :
    Nonempty (G ≃ₜ* H) :=
  sorry

end TauCetiRoadmap.ProfiniteProPGroups
