# Roadmap: profinite and pro-`p` groups

This roadmap develops the abstract group theory used throughout the arithmetic portfolio:
profinite foundations, supernatural order and Sylow theory, Frattini quotients and generator
rank, free pro-`p` groups, cohomological dimension, lower `p`-series, completed group algebras,
one-relator theory, and the classification of finite-rank Demushkin groups.

It does not identify the maximal pro-`p` quotient of a local absolute Galois group. That
arithmetic application, including roots of unity, rank formulas, Kummer orientations, and the
explicit local presentation, belongs to the **LocalGaloisGroups** roadmap, which consumes the
abstract exports here together with `LocalFieldsRamification` and `ClassFieldTheory`.

The **LocalFieldsRamification** roadmap is a separate arithmetic consumer of the abstract
contracts here. It uses profinite Sylow theory to identify wild inertia inside inertia and uses
the free-profinite and presented-profinite universal properties to identify the tame quotient.
Those arithmetic identifications belong there; the reusable Sylow and presentation carriers and
theorems belong here.

Three generic constructions that downstream roadmaps ask for are **deliberately not owned
here**, and have one exact owner: a focused successor roadmap, **`ProfiniteArithmetic`**. They
are the profinite integers as a topological commutative *ring*; the profinite power `x ^ᶻ a`
with a `ℤ̂` exponent on an arbitrary profinite group, together with its comparison against the
`ℤ_ℓ`-power on a maximal pro-`ℓ` quotient; and the continuous automorphism and outer-automorphism
groups of a profinite group, with the quotient topology on the latter. What stays here is
strictly less: `zHat` as a profinite *group* (Layer 4), the identification of its maximal pro-`p`
quotient with `ℤ_p`, and the `ℤ_p`-module structure of an abelian pro-`p` group (Layer 4) — the
three facts this roadmap's own Sylow, free-object and rank milestones consume. `BelyiMaps`
Layers 12–13 are the first consumer of the deferred three; they import them from
`ProfiniteArithmetic`, not from here and not from a Belyi-local copy.

## Scope and exported contract

The roadmap exports canonical carriers and universal properties for free profinite and free
pro-`p` groups, pro-`p` Sylow theory, the Frattini subgroup and generator-rank comparison,
cohomological criteria for freeness, the lower `p`-series and finite-quotient determinacy,
completed group algebras and relation modules, and the classification interface for abstract
Demushkin groups. It consumes continuous cohomology only from the accepted **Profinite
Cohomology** roadmap.

The frozen downstream surface includes:

| Topic | Exact declarations |
|---|---|
| pro-`p` carriers | `IsProP`, `proPKernel`, `maximalProPQuotient`, `IsProPSylow` |
| profinite Sylow interface | `exists_isProPSylow`, `IsProP.exists_le_isProPSylow`, `IsProPSylow.eq_of_normal`, `IsProPSylow.map_of_surjective` |
| finite generation | `IsTopologicallyFinitelyGenerated`, `topologicalGeneratorRank`, `topologicalGeneratorRankNat`, `proPFrattini` |
| free objects and presentations | `freeProfiniteGroup`, `freeProfiniteGroup.of`, `freeProC`, `freeProC.of`, `freeProP`, `freeProP.of`, `presentedProfiniteGroup`, `presentedProfiniteGroup.mk`, `presentedProP`, `presentedProP.mk` |
| their universal properties | `freeProfiniteGroup.lift`, `freeProfiniteGroup.hom_ext`, `freeProC.lift`, `freeProC.hom_ext`, `freeProP.lift`, `freeProP.hom_ext`, `presentedProfiniteGroup.lift`, `presentedProfiniteGroup.hom_ext`, `presentedProP.lift`, `presentedProP.hom_ext` |
| embedding problems and projectivity | `IsProC`, `FiniteEmbeddingProblem`, `FiniteEmbeddingProblem.IsSolution`, `HasElementaryAbelianSolutions`, `HasPGroupSolutions`, `levelProblem`, `IsProjective` |
| Demushkin invariants | `IsDemushkin`, `demushkinRank`, `demushkinQ`, `demushkinCharacter`, `HasPrescriptionProperty` |
| marked classification | `demushkinWordNeTwo`, `demushkinWordTwoOdd`, `demushkinWordTwoEven`, `isDemushkin_marked_of_q_ne_two`, `isDemushkin_marked_of_q_two_odd`, `isDemushkin_marked_of_q_two_even` |
| standard dyadic group | `demushkinD0`, `d0A`, `d0S`, `d0Y`, `standardD0Orientation` and its value theorems |

## How to read the milestones

`README.md` is normative; `Suggested.lean` pins useful Lean names and signatures. Dated
implementation and ecosystem information is maintained in a private provenance ledger. In prerequisite
annotations, `M` means Mathlib at the repository pin, `L0` through `L10` mean an earlier
layer here, and `PC-<layer>` means an export of `ProfiniteCohomology`. No milestone depends
on a branch, an unmerged external project, `LocalFieldsRamification`, or `ClassFieldTheory`.

Theorems use the unbundled profinite type-class stack except where a categorical limit or
completion genuinely needs `ProfiniteGrp`. Pro-`p` means that every continuous finite
quotient is a `p`-group. Orders and closed-subgroup indices take supernatural values;
generator rank is cardinal-valued in general and has a separate natural-number accessor
under topological finite generation. Presentations always quotient by a **closed** normal
closure. The Demushkin cup product is the one supplied by `ProfiniteCohomology`, and the
commutator convention in relator words is Labute's `(x,y) = x⁻¹y⁻¹xy`.

## The build, in layers

### Layer 0: profinite foundations

- **The instance chain.** A totally disconnected topological group is T1, because its
  components are closed, hence T2, hence T3. Prove the missing glue instances once, so that
  no statement carries `[T2Space G]`.
  *Needs:* M `TotallyDisconnectedSpace`, M `IsTopologicalGroup`.
- **Quotients by closed normal subgroups.** For `G` profinite and `N` a closed normal
  subgroup, `G ⧸ N` is profinite. The missing ingredient is
  `TotallyDisconnectedSpace (G ⧸ N)`, by the clopen-image argument; package it with the
  compactness and topological-group instances, which exist.
  *Needs:* M `QuotientGroup.instTopologicalSpace`, M `IsTopologicalGroup`.
  ⚠ Closedness of `N` is a hypothesis, not decoration. A quotient by a non-closed subgroup
  is not T1. Example: `ℤ̂ ⧸ ℤ` with `ℤ` dense.
- **Closed and open subgroups.** A closed subgroup of a profinite group is profinite:
  assemble the instances. An element that lies in every open normal subgroup is `1`. A
  subgroup is open if and only if it is closed of finite index. Open normal subgroups of
  `G ⧸ N` correspond to open normal subgroups of `G` above `N`.
  *Needs:* M `closedSubgroup_eq_sInf_open`, M `ClosedSubgroup`, M `OpenSubgroup`.
- **Inverse limits, unbundled.** Restate the limit description for consumers outside the
  category: a compatible family of elements of the finite quotients of `G` comes from a
  unique element. Prove the compactness lemma in the form that Layer 8 uses: a directed
  family of nonempty closed subsets of a profinite set has nonempty intersection.
  *Needs:* M `ProfiniteGrp.toLimit_surjective`, M `ProfiniteGrp.toLimit_injective`.
  *Source:* Ribes–Zalesskii Prop. 1.1.4 for the compactness lemma.
- **Profinite completion.** Consume `ProfiniteGrp.ProfiniteCompletion`. Add the unbundled
  universal property: continuous homomorphisms from the completion to a profinite `P`
  correspond to abstract homomorphisms from `G`. Add that the unit is bijective on a finite
  group (`Suggested.lean`).
  *Needs:* M `ProfiniteGrp.profiniteCompletion`, M `ProfiniteGrp.ProfiniteCompletion.lift`.
  ⚠ An abstract homomorphism out of a profinite group need not be continuous, so the
  completion of the underlying abstract group of a profinite group is in general larger.
  That subject (Nikolov–Segal) is outside this roadmap.
  ⚠ No milestone of this roadmap assumes second countability. The absolute Galois group of a
  general field is not second countable. Where a later theorem wants a countable
  neighbourhood basis, it carries "countably many open normal subgroups" as a hypothesis,
  which Layer 3 discharges for topologically finitely generated groups.

### Layer 1: supernatural order and index

- **Supernatural numbers.** `Supernatural := Nat.Primes → ℕ∞`, with:
  - divisibility as pointwise `≤`, and multiplication as pointwise `+`;
  - the lattice operations as pointwise `⊔` and `⊓`;
  - the embedding of `ℕ+` by prime factorization;
  - the predicate "is a natural number";
  - the `p`-primary part and the prime-to-`p` part.
  *Needs:* M `padicValNat`, M `Nat.Primes`, M `ℕ∞`.

  API checklist for `Supernatural`:
  - Constructors: the embedding `ofNat : ℕ+ → Supernatural`; the constant `1`; `p ^ ∞`.
  - Examples: the order of `ℤ_p` is `p^∞`; the order of `ℤ̂` is `∏_ℓ ℓ^∞`.
  - Morphisms: the order-preserving embedding of `ℕ+`, and the projection to the `ℓ`-adic
    exponent.
  - Functoriality: none; this is an order-theoretic object.
  - Comparison lemmas: `ofNat` is multiplicative and injective, and it takes `Nat.gcd` and
    `Nat.lcm` to `⊓` and `⊔`.
  - Naturality: divisibility, product and lattice operations agree with the `ℕ+` ones under
    `ofNat`.
  - Edge cases: the value `0` at a prime, and the value `∞`; the theorem that a supernatural
    number is a natural number if and only if it has finite support and finite values.
  - Downstream interfaces: `profiniteOrder`, `profiniteIndex`, and the condition
    `¬ p ∣ profiniteIndex P G` in the Sylow definition of Layer 2.
- **The order of a profinite group.** `profiniteOrder G : Supernatural` takes at each prime
  the supremum of the valuations of the orders of the finite quotients. On a finite discrete
  group it is the factorization of `Nat.card G` (`Suggested.lean`).
  *Needs:* L1 `Supernatural`, M `Nat.card`, M `OpenNormalSubgroup`.
- **The index of a closed subgroup.** The definition is primewise through the finite
  quotients: `profiniteIndex H G ℓ = ⨆_N v_ℓ ([G/N : HN/N])`, the supremum over open normal
  `N ≤ G`. Both groups live in the same universe. The definition is written for an arbitrary
  subgroup; closedness of `H` is a hypothesis of the theorems.
  **Theorem.** For closed `H`, `profiniteIndex H G = ⨆ {U : OpenSubgroup G // H ≤ U}, [G : U]`
  in the supernatural lattice. This is the description that the literature uses.
  *Needs:* L1 `Supernatural`, L0 closed-subgroup theory, M `Subgroup.index`.
  *Source:* Ribes–Zalesskii §2.3.
  Both sides depend only on the closure of `H`, so two further statements come first:
  `profiniteIndex H G = profiniteIndex (closure H) G`, and
  `profiniteIndex H G = 1 ↔ closure H = ⊤`. For closed `H` the second is
  `profiniteIndex H G = 1 ↔ H = ⊤`.
  ⚠ Closedness is a hypothesis of Lagrange and of every statement that treats `H` as a
  profinite group in its own right. It is not needed for the two statements just above, and
  a dense proper subgroup is not a counterexample to them: its image in every finite
  quotient is everything, so both sides are `1`.
- **Index API.** All of the following, which later layers use:
  - invariance under a topological isomorphism of the pair;
  - `profiniteIndex H G = 1` if and only if `H = ⊤`, for closed `H`;
  - multiplicativity in a tower of closed subgroups;
  - the image formula under a continuous surjection;
  - Lagrange: `profiniteOrder G = profiniteOrder H * profiniteIndex H G`;
  - agreement with `Subgroup.index` for open `H`, as
    `profiniteIndex H G = ofNat (H.index)`.
  *Needs:* L1 the two definitions above; M `Subgroup.index_mul_card`.
  *Source:* Ribes–Zalesskii §2.3, Prop. 2.3.2 for Lagrange.
- **Pro-`p` in supernatural terms.** `G` is pro-`p` if and only if `profiniteOrder G` is
  supported at `p` (`Suggested.lean`). `H` is open if and only if it is closed of
  natural-number index.
  *Needs:* L1 order and index; L0 open-versus-closed.

### Layer 2: profinite Sylow theory

- **Definition.** `IsProPSylow p P` says that `P` is closed, is pro-`p` in the subspace
  topology, and has index prime to `p`. `Suggested.lean` has the per-quotient form. The
  supernatural form `¬ p ∣ profiniteIndex P G` is proved equivalent to it here.
  *Needs:* L1 index, L0 closed subgroups, M `IsPGroup`.

  API checklist for `IsProPSylow`:
  - Constructors: from a compatible family of Sylow subgroups of the finite quotients; from
    a maximal closed pro-`p` subgroup.
  - Examples: `P = ⊤` when `G` is pro-`p`; the `p`-Sylow subgroup of `ℤ̂`, which is `ℤ_p`.
  - Morphisms: the inclusion `P ≤ G` as a closed embedding of profinite groups.
  - Functoriality: the image under a continuous surjection is `p`-Sylow.
  - Comparison lemmas: the per-quotient form and the supernatural form agree; on a finite
    group the predicate agrees with Mathlib's `Sylow`.
  - Naturality: conjugation by `g` takes `p`-Sylow subgroups to `p`-Sylow subgroups, and the
    correspondence commutes with continuous surjections.
  - Edge cases: `p` not dividing the order, where `P = 1`; the trivial group.
  - Downstream interfaces: the abstract existence, conjugacy, containment, uniqueness, and
    surjective-image theorems; `LocalGaloisGroups` is an arithmetic consumer.
- **Existence.** Every profinite group has a `p`-Sylow subgroup. Route: the sets of Sylow
  `p`-subgroups of the finite quotients form a surjective inverse system of nonempty finite
  sets, so the Layer 0 compactness lemma applies.
  *Needs:* L0 compactness lemma; M `Sylow.exists_subgroup_card_pow_prime`, M `Sylow`.
  *Source:* Ribes–Zalesskii Cor. 2.3.6.
- **Conjugacy and the poset.** Any two `p`-Sylow subgroups are conjugate, by the same
  inverse-limit argument over the finite sets of conjugating elements. Every closed pro-`p`
  subgroup lies in a `p`-Sylow subgroup. A pro-`p` subgroup of index prime to `p` is maximal
  pro-`p`, and a maximal closed pro-`p` subgroup is `p`-Sylow. A normal `p`-Sylow subgroup
  is unique.
  *Needs:* L2 existence; L0 compactness lemma; M `Sylow.conj_eq`.
  *Source:* Ribes–Zalesskii §2.3.
- **Functoriality.** The image of a `p`-Sylow subgroup under a continuous surjection is
  `p`-Sylow. The `p`-Sylow subgroup of an inverse limit is the inverse limit of `p`-Sylow
  subgroups. Both statements are intrinsic to profinite groups. `LocalGaloisGroups` may
  consume them when assembling its arithmetic examples.
  *Needs:* L2 existence and conjugacy; L0 inverse limits.
- **Worked instances** (`Suggested.lean`). Every `p`-Sylow subgroup of `ℤ̂` is
  topologically isomorphic to `ℤ_p`. This is stated here and proved in Layer 4, where the
  universal properties it
  uses are available. Its proof does **not** use a product decomposition `ℤ̂ ≅ ∏_ℓ ℤ_ℓ`,
  which is not a target of this roadmap.
  *Needs:* L2 existence; L4 the rank-one identification chain.

### Layer 3: pro-`p` groups, the maximal pro-`p` quotient, Frattini theory, generation

- **The `IsProP` API.** Stability under closed subgroups, under quotients by closed normal
  subgroups, under finite products, and under inverse limits. The equivalence milestone: a
  profinite group is pro-`p` if and only if it is continuously isomorphic to a limit of
  finite `p`-groups.
  *Needs:* M `IsPGroup`, M `ProfiniteGrp.ofFiniteGrp`, M
  `ProfiniteGrp.continuousMulEquivLimittoFiniteQuotientFunctor`; L0 quotients.

  API checklist for `IsProP`:
  - Constructors: from the quotient form; from a presentation as a limit of finite
    `p`-groups; from `IsPGroup` on a finite discrete group.
  - Examples: `ℤ_p`; `ℤ/p^n`; `freeProP p (Fin n)`; `D₀` of Layer 6.
  - Morphisms: continuous homomorphisms between pro-`p` groups; no extra structure.
  - Functoriality: the property passes to closed subgroups, to quotients by closed normal
    subgroups, to finite products and to limits.
  - Comparison lemmas: pro-`p` if and only if the supernatural order is a power of `p`
    (Layer 1); pro-`p` if and only if `proPKernel p G = ⊥`.
  - Naturality: the property is invariant under topological isomorphism.
  - Edge cases: the trivial group is pro-`p` for every `p`; a finite discrete `p`-group is
    pro-`p`; a group that is pro-`p` for two different primes is trivial.
  - Downstream interfaces: closed-subgroup and quotient constructions in later layers.
- **The maximal pro-`p` quotient.** `proPKernel p G` is the intersection of the open normal
  subgroups with `p`-group quotient. It is closed, normal, characteristic for continuous
  automorphisms, and preserved by continuous homomorphisms. Then
  `maximalProPQuotient p G := G ⧸ proPKernel p G`, which is pro-`p`, by the compactness
  argument that an open normal subgroup containing the kernel already contains a member of
  the defining family. State its quotient map, its universal property, its idempotence on
  pro-`p` groups, and its functoriality once, here.
  *Needs:* L0 quotients and closed subgroups; M `OpenNormalSubgroup`; M `IsPGroup`.

  API checklist for `maximalProPQuotient`:
  - Constructors: the quotient map `G ↠ G(p)`; the induced map for a continuous
    homomorphism.
  - Examples: `maximalProPQuotient p ℤ̂ ≅ ℤ_p` (Layer 4); `maximalProPQuotient p G = G` for
    pro-`p` `G`.
  - Morphisms: continuous homomorphisms to a pro-`p` group factor uniquely through it.
  - Functoriality: functorial in `G` for continuous homomorphisms; idempotent.
  - Comparison lemmas: `proCKernel (finiteGroupClassP p) G = proPKernel p G` (Layer 4).
  - Naturality: the factorization is natural in both the source and the target.
  - Edge cases: `proPKernel p G = ⊤` when `G` has no `p`-group quotient, so `G(p)` is
    trivial; a prime that does not divide the order.
  - Downstream interfaces: `LocalGaloisGroups` applies this universal quotient to an
    absolute Galois group; the resulting arithmetic carrier is defined there.
- **Topological generation and rank.** First the generation API through
  `Subgroup.topologicalClosure`, the predicate `IsTopologicallyFinitelyGenerated`, and the
  statement that generation passes along continuous surjections. Then the convergence
  predicate `ConvergesToOne`, with:
  - finite sets converge to `1`;
  - a subset of a converging set converges to `1`;
  - a continuous image of a converging set converges to `1`;
  - **every profinite group has a generating set that converges to `1`**, so that
    `topologicalGeneratorRank` is an infimum over a nonempty family.

  Then the rank itself, with:
  - monotonicity under continuous surjections;
  - invariance under topological isomorphism;
  - finiteness of the cardinal exactly under `IsTopologicallyFinitelyGenerated`;
  - the accessor `topologicalGeneratorRankNat G h`, with
    `(topologicalGeneratorRankNat G h : Cardinal) = topologicalGeneratorRank G`, and proof
    irrelevance in `h`.
  *Needs:* L0 open normal subgroups; M `Subgroup.topologicalClosure`; M `Cardinal`.
  *Source:* Ribes–Zalesskii Prop. 2.6.2 for the existence of a converging generating set.

  API checklist for `topologicalGeneratorRank`:
  - Constructors: from a converging generating set; from the finite accessor.
  - Examples: `d(ℤ_p) = 1`; `d(freeProP p (Fin n)) = n`; `d(∏_{i ∈ ℕ} ℤ/p) = ℵ₀`.
  - Morphisms: continuous surjections do not raise the rank.
  - Functoriality: monotone under continuous surjections; invariant under topological
    isomorphism.
  - Comparison lemmas: agreement with `topologicalGeneratorRankNat`; agreement with
    `Group.rank` on a finite discrete group; the identity with `dim_{𝔽_p} Hom_cont(G, 𝔽_p)`
    for pro-`p` `G`.
  - Naturality: the rank of a quotient is at most the rank of the group, compatibly with
    composition of surjections.
  - Edge cases: the trivial group has rank `0`; an infinite-rank group, where the accessor
    is unavailable; the difference from the unrestricted notion, which the convention above
    records.
  - Downstream interfaces: the Schreier bound below and the Euler formulas of Layers 6 and 7.
- **Open subgroups of each index, and countability.** A topologically finitely generated
  profinite group has finitely many open subgroups of each index, because it has finitely
  many continuous maps to each finite group. Four consequences are proved here:
  - the set of open subgroups is countable;
  - the set of open normal subgroups is countable;
  - there is a descending sequence `(N_k)` of open normal subgroups, cofinal among them;
  - hence the sequential form of the Layer 0 compactness lemma holds.

  Layer 8 uses the sequential form. Prefer the general form wherever it is enough.
  *Needs:* L3 `IsTopologicallyFinitelyGenerated`; L0 compactness lemma.
- **The Schreier bound.** An open subgroup `U` of a topologically finitely generated
  profinite group is topologically finitely generated, with
  `d(U) ≤ 1 + [G : U](d(G) - 1)` in natural numbers.
  *Needs:* L3 rank; M `Subgroup.index`.
  *Source:* Ribes–Zalesskii Cor. 3.6.3. Layer 6 proves equality in the free case.
- **Hopf property.** A continuous surjective endomorphism of a topologically finitely
  generated profinite group is an isomorphism (`Suggested.lean`). This is the last step of
  every two-sided comparison in Layer 8.
  *Needs:* L3 finitely many open subgroups of each index; L0 compactness.
  *Source:* Ribes–Zalesskii Prop. 2.5.2.
  ⚠ False without finite generation: an infinite product of copies of a finite group admits
  a continuous surjective endomorphism that is not injective, namely the shift.
- **Gaschütz lifting.** Along a continuous surjection of profinite groups, an `n`-tuple that
  topologically generates the target lifts to an `n`-tuple that topologically generates the
  source, provided the source is topologically generated by `n` elements
  (`Suggested.lean`). Corollary: for a quotient map whose kernel lies in `Φ(G)`, generators
  lift.
  *Needs:* L3 generation API; L0 compactness lemma.
  *Source:* Ribes–Zalesskii Prop. 2.5.4.
- **Frattini theory for pro-`p` groups.** For pro-`p` `G`, a maximal open subgroup is normal
  of index `p`; the finite input is that a maximal subgroup of a finite `p`-group is normal
  of index `p`. `proPFrattini p G`, in the index-`p` form, is closed, normal and
  characteristic, and it equals both the intersection of the maximal open subgroups and
  `closure (Gᵖ[G,G])` (`Suggested.lean`). The Frattini quotient `G/Φ(G)` is elementary
  abelian, hence an `𝔽_p`-vector space.
  *Needs:* M `frattini`, M `IsPGroup.exists_maximal_subgroup_normal` and the finite Frattini
  lemmas; L3 `IsProP` API; L0 quotients.

  API checklist for `proPFrattini`:
  - Constructors: the index-`p` definition; the verbal description `closure (Gᵖ[G,G])`.
  - Examples: `Φ(ℤ_p) = pℤ_p`; `Φ(freeProP p (Fin n))` with quotient `(ℤ/p)^n`;
    `Φ((ℤ/p)^n) = 1`.
  - Morphisms: the quotient map to the Frattini quotient, as a map of `𝔽_p`-vector spaces.
  - Functoriality: a continuous surjection sends `Φ(G)` onto `Φ(H)`; every continuous
    endomorphism preserves `Φ(G)`.
  - Comparison lemmas: the two descriptions agree; on a finite `p`-group the object agrees
    with Mathlib's `frattini`.
  - Naturality: the Frattini quotient functor commutes with continuous surjections.
  - Edge cases: `Φ(G) = G` is impossible for nontrivial pro-`p` `G`; the abstract `frattini`
    differs when `G` is not finitely generated.
  - Downstream interfaces: Burnside below and the abstract rank formulas.
- **Burnside basis theorem.** A subset generates `G` topologically if and only if its image
  generates `G/Φ(G)` topologically. The closure on the quotient side is needed: at infinite
  rank the image of a generating set spans only a dense subspace. Two further forms are in
  `Suggested.lean`:
  - a closed subgroup that lies in no open normal subgroup of index `p` is the whole group;
  - a continuous homomorphism that is surjective onto every index-`p` quotient is
    surjective.

  The rank identity is proved first as an identity of cardinals, with no finiteness
  hypothesis, against the discrete dual:
  `topologicalGeneratorRank G = Module.rank (ZMod p) (Hom_cont(G/Φ(G), 𝔽_p))`, where
  `Hom_cont(G/Φ(G), 𝔽_p) = Hom_cont(G, 𝔽_p)` is a discrete `𝔽_p`-vector space. Then `G` is
  topologically finitely generated if and only if `G/Φ(G)` is finite, and in that case
  `topologicalGeneratorRankNat G h = Module.finrank (ZMod p) (G/Φ(G))`.
  *Needs:* L3 Frattini theory, L3 rank and `ConvergesToOne`; M `Module.rank`, M
  `Module.finrank`.
  *Source:* Ribes–Zalesskii Prop. 2.8.7 and §2.8; NSW (3.9.1).
  Proof note for the cardinal identity. A continuous functional vanishes on all but finitely
  many members of a converging set. So restriction embeds the dual in the finitely supported
  functions on that set, which bounds the dimension of the dual by the cardinality of the
  set. The dual basis of a converging basis gives the other inequality.
  ⚠ **Abstract generation and topological generation are different.** Every statement here
  is about topological generation. The Frattini quotient is why the two agree numerically
  for pro-`p` groups.

### Layer 4: free pro-`p` and pro-`C` groups on finite sets

- **The class `C` as a structure.** `FiniteGroupClass` with the fields listed in the
  conventions, the derived theorem on finite products, and the `Shrink` resizing policy.
  From it: `proCKernel C G`, which is closed, normal and characteristic, with the API of
  `proPKernel`; `proCCompletion C G := G ⧸ proCKernel C G` with its universal property; and
  the instantiation `finiteGroupClassP p`, with
  `proCKernel (finiteGroupClassP p) G = proPKernel p G`. Every pro-`C` statement below is
  about this structure, and there is no per-class construction.
  *Needs:* L3 `proPKernel` API; M `Shrink`; M `IsPGroup`.

  API checklist for `FiniteGroupClass`:
  - Constructors: `finiteGroupClassP p`; the class of all finite groups; the class of finite
    solvable groups. ⚠ The class of finite nilpotent groups is **not** an example: it is not
    closed under extensions, because `1 → C₃ → S₃ → C₂ → 1` has nilpotent kernel and
    quotient while `S₃` is not nilpotent.
  - Examples: finite `p`-groups, where `proCCompletion` is `maximalProPQuotient`.
  - Morphisms: none between classes is needed; inclusion of classes is a predicate on `mem`.
  - Functoriality: `proCKernel C` is preserved by continuous homomorphisms, and
    `proCCompletion C` is functorial and idempotent.
  - Comparison lemmas: `mem_congr` transports membership along a group isomorphism;
    `Shrink` transports it between universes; `proCKernel (finiteGroupClassP p) = proPKernel p`.
  - Naturality: the universal property of `proCCompletion` is natural in `G`.
  - Edge cases: the class that contains only the trivial group, where the completion is
    trivial; a class that is not closed under extensions, which is why that field exists.
  - Downstream interfaces: `freeProC`, and Layer 10's free object on a profinite space.
- **Construction of the free objects.**
  - `freeProfiniteGroup X := profiniteCompletion (FreeGroup X)`, the free profinite group,
    with its generators and its universal property;
  - `presentedProfiniteGroup X rels`, the quotient of `freeProfiniteGroup X` by the closed
    normal closure of a set of relators;
  - `freeProC C X := proCCompletion C (freeProfiniteGroup X)`;
  - `freeProP p X := maximalProPQuotient p (freeProfiniteGroup X)`.

  The pro-`p` quotient is taken directly, because `proPKernel` and
  `proCKernel (finiteGroupClassP p)` are cut out by different index sets and agree by a
  short theorem, not by unfolding. That theorem,
  `freeProC (finiteGroupClassP p) X ≅ freeProP p X`, is the first milestone here, and after
  it no statement has to choose between the two constructions. The profinite objects
  `freeProfiniteGroup` and `presentedProfiniteGroup` remain part of the abstract exported
  presentation API.
  *Needs:* M `ProfiniteGrp.profiniteCompletion`, M `FreeGroup`; L3 `maximalProPQuotient`;
  L4 `FiniteGroupClass`.

  API checklist for `freeProP`:
  - Constructors: `freeProP.of` on generators; the lift of a map `X → P` into a pro-`p`
    group `P`.
  - Examples: `freeProP p (Fin 0) ≅ 1`; `freeProP p (Fin 1) ≅ ℤ_p`; `freeProP 2 (Fin 3)`,
    the source of the relator `A²S⁴(S,Y)`.
  - Morphisms: continuous homomorphisms out of it are exactly maps on generators; the
    quotient maps to presented groups.
  - Functoriality: a map `X → Y` induces a continuous homomorphism, functorially; a
    surjection of generating sets gives a surjection of groups.
  - Comparison lemmas: agreement with `freeProC (finiteGroupClassP p) X`; agreement with the
    pro-`p` completion of the discrete free group; `FreeGroup X → freeProP p X` is
    injective.
  - Naturality: the universal property is natural in `X` and in the target.
  - Edge cases: the empty generating set; a one-element generating set, which gives `ℤ_p`;
    an infinite generating set, where the rank is **not** `#X` and Layer 10 applies.
  - Downstream interfaces: presentations in Layer 5, the tower of Layer 8, the normal forms
    of Layer 9.
- **Universal property.** A map `X → P` into a profinite group `P` in the class `C` extends
  uniquely to a continuous homomorphism (`Suggested.lean` has the pro-`p` case). The free
  object is unique up to unique isomorphism, and it is functorial in `X`.
  *Needs:* L4 construction; M `ProfiniteGrp.ProfiniteCompletion.lift`.
- **Basics.** `freeProP p X` is pro-`p`. For finite `X` it is topologically finitely
  generated (`Suggested.lean`), of rank `#X`, through the Frattini quotient `(ℤ/p)^X` of
  Layer 3, with the natural-number form
  `topologicalGeneratorRankNat (freeProP p (Fin n)) h = n`. The generators are a basis: free
  groups are residually `p`, so `FreeGroup X → freeProP p X` is injective
  (`Suggested.lean`).
  *Needs:* L3 Burnside; L4 universal property; M `FreeGroup`.
  *Source:* the residual `p`-finiteness of free groups; the argument uses the finite
  upper-triangular representations, or the lower `p`-series of the discrete free group.
  ⚠ For infinite `X` the rank of `freeProP p X` is **not** `#X`. Its continuous characters
  are all maps `X → 𝔽_p`, so the rank is `p^{#X}` by the Erdős–Kaplansky theorem. Layer 10
  states the free objects on infinite bases, on a profinite space.
- **Rank one and `ℤ_p`.** `freeProP p (Fin 0) ≅ 1`, and the rank-one identification is a
  chain of universal properties, each step a named theorem, with no product decomposition of
  `ℤ̂` anywhere:
  1. `maximalProPQuotient p (profiniteCompletion ℤ) ≅ lim_n ℤ/p^nℤ` as topological groups,
     because the open normal subgroups of `ℤ̂` with `p`-group quotient are the `p^nℤ̂`;
  2. `lim_n ℤ/p^nℤ ≅ ℤ_p`: Mathlib's `ℤ_[p]` with its `toZModPow` system is that inverse
     limit as a topological ring, hence as a topological group;
  3. `freeProP p (Fin 1) ≅ Multiplicative ℤ_[p]`: both objects represent the same functor,
     because a continuous homomorphism from either to a pro-`p` group `P` is an element of
     `P`, so the uniqueness of the free object gives the isomorphism;
  4. a closed subgroup `P ≤ ℤ̂` is `p`-Sylow if and only if
     `P ↪ ℤ̂ ↠ maximalProPQuotient p ℤ̂` is a topological isomorphism, which with steps 1
     and 2 proves the Layer 2 instance.

  Step 3 is what every later `ℤ_p`-coefficient argument cites, in particular the
  identification of the characters `Hom_cont(G, ℤ_pˣ)` in Layer 7.
  *Needs:* L3 `maximalProPQuotient`; L4 universal property; M `PadicInt.toZModPow`.

#### Finitely generated abelian pro-`p` groups

This subsection mentions no Demushkin group. Layer 7 cannot define `q(G)` without it, and
several Layer 9 module arguments use it. Ribes–Zalesskii §4.3 is the source of record.

- **Exponentiation by `ℤ_p`.** For abelian pro-`p` `A`, the continuous action
  `ℤ_p × A → A`, `(λ, a) ↦ a^λ`, is the inverse limit of exponentiation in the finite
  abelian `p`-quotients, where `ℤ_p` acts through `ℤ/p^n`. Well-definedness is the
  compatibility of those actions, and continuity is the limit topology.
  *Needs:* L0 inverse limits; L3 `IsProP` API; M `ZMod.intCast_cast` and `PadicInt.toZModPow`.
- **The `ℤ_p`-module structure.** `A` becomes a topological `ℤ_p`-module, functorially in
  continuous homomorphisms of abelian pro-`p` groups. Closed subgroups and quotients are
  submodules and quotient modules. A continuous group homomorphism between abelian pro-`p`
  groups is automatically `ℤ_p`-linear.
  *Needs:* L4 exponentiation; M `Module`.
- **Compact `ℤ_p`-modules.** A topologically finitely generated abelian pro-`p` group is a
  finitely generated `ℤ_p`-module, and the two notions of generation agree. The full
  equivalence of categories is not a target.
  *Needs:* L4 module structure; L3 rank.
- **Structure theorem.** `A ≅ ℤ_p^r × T` as topological `ℤ_p`-modules, with `T` a finite
  abelian `p`-group. The number `r` and the elementary divisors of `T` are unique. `T` is
  the torsion subgroup of `A`; it is closed always, and open when `r = 0`.
  *Needs:* L4 compact modules; M the structure theorem for finitely generated modules over a
  principal ideal domain, `Module.equiv_free_prod_directSum` and the `ℤ_[p]` PID instance.
  *Source:* Ribes–Zalesskii §4.3.
  ⚠ The theorem needs topological finite generation. `∏_{i ∈ ℕ} ℤ/p` is abelian pro-`p` and
  is not of this shape.
- **The pro-`p` completion of `ℤ`, as a module statement.** The universal-property proof
  that `freeProP p (Fin 1)`, `maximalProPQuotient p (profiniteCompletion ℤ)` and
  `Multiplicative ℤ_[p]` agree is the rank-one item above. Here it is restated as the fact
  that `ℤ_p` is the free `ℤ_p`-module of rank 1, and that the two notions of rank agree.
  *Needs:* L4 rank-one chain, L4 module structure.

### Layer 5: presentations, extensions, and the rank interpretations

#### The coefficient objects, over the imported carrier

**The carrier is Mathlib's, and its calculus is the Profinite Cohomology roadmap's.** At the
pin, `Mathlib/Algebra/Category/ContinuousCohomology/Basic.lean` defines `continuousCohomology n`
in every degree, as the homology of homogeneous cochains of a topological representation. That
object is the carrier of every cohomological statement in this roadmap. This roadmap defines no
second cohomology theory and no second cohomological operation: a private carrier would admit
terms that satisfy its signatures without satisfying the exactness and pairing laws that the
later layers use, and a private operation would need an unproved comparison with the one that
already exists.

What this layer introduces is the coefficient object the pro-`p` theory computes with, and nothing
about the substrate.

- **The coefficient object.** `trivialFp p G` is the trivial `𝔽_p`-representation of `G`, an
  object of `ProfiniteCohomology.TopRep (ZMod p) G`, and `cohomFp p G n` is its cohomology,
  `(continuousCohomology (ZMod p) G n).obj (trivialFp p G)`. Mathlib places the coefficients in
  the universe of `G`, so the trivial module is `ULift (ZMod p)`, which `Suggested.lean`
  records. Every dimension count in this roadmap is about `cohomFp`. The other coefficient
  systems used below are `I(χ)/p^i` and `𝔽_p[G/U]` for `U` open.
  *Needs:* PC-1 `TopRep`, M `continuousCohomology`, M `TopModuleCat`, M `Action`.
- **The multiplication pairing and the cup square.** `fpPairing p G` is the term of
  `ProfiniteCohomology.TopPairing` on `trivialFp p G` given by multiplication in `ZMod p`; it is
  `ZMod p`-bilinear, continuous because the coefficients are discrete, and equivariant because
  the action is trivial. `cupFp p G a b` is `ProfiniteCohomology.cup (fpPairing p G) 1 1 a b`,
  transported from degree `1 + 1` to degree `2`. This is the cup square
  `H¹(G, 𝔽_p) × H¹(G, 𝔽_p) → H²(G, 𝔽_p)` that the Demushkin predicate is stated against,
  and it is the only cup product in this roadmap. Its graded
  commutativity, `cupFp a b = - cupFp b a`, is the specialization of
  `ProfiniteCohomology.cup_gradedComm` at the pairing, whose opposite pairing is itself because
  multiplication in `ZMod p` is commutative. Graded commutativity turns right nondegeneracy of a
  cup pairing into a consequence of left nondegeneracy, so Layer 7 cites only this result.
  *Needs:* PC-12 `TopPairing`, `ofDiscreteModulePairing`, `cup`, `cup_gradedComm`, `degreeCast`.
  *Source:* NSW I §1.4 for the cochain formula.

  API checklist for the coefficient objects:
  - Constructors: `trivialFp`; `fpPairing` from multiplication on `ZMod p`; the class of a
    cocycle, through the imported comparison isomorphisms.
  - Examples: `H¹(G, 𝔽_p) ≅ Hom_cont(G, 𝔽_p)`; `H²(ℤ/2, 𝔽₂)` is one-dimensional, generated by
    the class of the extension `ℤ/4`; `H²(F, 𝔽_p) = 0` for `F` free pro-`p` of finite rank.
  - Morphisms: inflation, restriction, corestriction, the connecting map, and the maps induced
    by a map of coefficients, all imported.
  - Functoriality: contravariant in the group, covariant in the coefficients, both imported.
  - Comparison lemmas: `fpPairing_bil`, the defining equation of the pairing; the imported
    `explicitIso_cup` relating the canonical cup to the explicit `(1,1)` shape.
  - Naturality: `cup_res`, `cup_infl`, `cup_coeffMap` and `cup_projection`, all imported.
  - Edge cases: the trivial group, where `H^n` vanishes for `n ≥ 1`; a finite group, where the
    imported comparison with discrete `groupCohomology` applies; coefficients with a nontrivial
    action, where `H⁰` is not all of `M`, which is the `I(χ)/p^i` system of Layer 7.
  - Downstream interfaces: cohomological dimension in Layer 6, the Demushkin predicate in
    Layer 7, and the rank interpretations below.

#### Presentations

- **Presented pro-`p` groups.** `presentedProP p X rels` is the free pro-`p` group modulo
  the closed normal closure of the relators. Every topologically finitely generated pro-`p`
  group has a presentation by a free pro-`p` group of finite rank, and has a minimal one,
  with `topologicalGeneratorRankNat F = topologicalGeneratorRankNat G`, characterized by
  `R ≤ Φ(F)`.
  *Needs:* L4 free objects; L3 Burnside and Gaschütz.
  ⚠ A presentation of an arbitrary pro-`p` group needs free objects on an infinite basis
  that converges to `1`, which is Layer 10. The arbitrary-rank presentation theorem is
  stated there.

  API checklist for `presentedProP`:
  - Constructors: the quotient map from the free pro-`p` group; the induced map out of a
    presented group, given that the relators die in the target.
  - Examples: `D₀` at `p = 2`; `presentedProP p X ∅ ≅ freeProP p X`; the normal forms of
    Layer 9.
  - Morphisms: continuous homomorphisms out of it are maps on generators that kill the
    relators.
  - Functoriality: a map of presentations, that is of generator sets and relator sets,
    induces a continuous homomorphism.
  - Comparison lemmas: agreement with `freeProP p X ⧸ R` for `R` the closed normal closure;
    the profinite version `presentedProfiniteGroup` maps onto it.
  - Naturality: the universal property is natural in the target.
  - Edge cases: an empty relator set; a relator set whose closed normal closure is
    everything, where the presented group is trivial; the difference between the algebraic
    and the closed normal closure.
  - Downstream interfaces: minimal presentations, the relation rank below, and the Layer 9
    normal forms.
- **Non-vacuity, with the map named.** `D₀ = ⟨A, S, Y ∣ A²S⁴(S,Y)⟩`, defined in
  `Suggested.lean`, is nontrivial, pro-`2` and topologically finitely generated. The proof
  is not "map it onto some finite `2`-group". The map is `φ : freeProP 2 (Fin 3) → ℤ/2` with
  `φ(A) = 0`, `φ(S) = 1`, `φ(Y) = 0`, given by the universal property of Layer 4. The
  relator maps to `0·2 + 1·4 + 0 = 0`, because the commutator vanishes in an abelian group,
  so
  `φ` factors through `D₀`, and `D₀ ↠ ℤ/2` is surjective. Therefore `D₀` is nontrivial.
  *Needs:* L4 universal property; L5 presentations.

#### Continuous extensions and finite `p`-embedding problems

- **The extension object.** For profinite `G` and a finite discrete abelian `p`-primary
  `G`-module `M`, an extension is a short exact sequence `1 → M → E → G → 1` of topological
  groups such that:
  - `E` is profinite;
  - `M → E` is injective onto a **closed** normal subgroup;
  - `E → G` is a continuous surjection whose kernel is that subgroup;
  - conjugation of `E` on `M` induces the given action.

  A finite subgroup of a profinite group is closed and carries the discrete topology, so the
  injection is a topological embedding. Morphisms are the continuous homomorphisms that fix
  `M` and cover the identity of `G`. Every such morphism is an isomorphism.
  *Needs:* L0 profinite foundations.
  ⚠ Do **not** ask `M` to be open in `E`. An open `M` makes `G` finite, and the groups this
  dictionary is used on are infinite.
- **Continuous sections along a finite kernel.** If `E` is profinite and `N ≤ E` is a finite
  normal subgroup, then `E ↠ E/N` has a continuous set-theoretic section that sends `1` to
  `1`. The proof has three steps. First, `E` has an open normal subgroup `U` with
  `U ∩ N = 1`; intersect the open normal subgroups that separate the finitely many
  nontrivial elements of `N` from `1`. Second, `U` maps isomorphically onto an open subgroup
  of `E/N`, which has finite index. Third, finitely many coset translates of that local
  section give a section over a clopen partition of `E/N`.
  *Needs:* L0 open normal subgroups.
  ⚠ A surjection of profinite **spaces** need not have a continuous section, so no statement
  here uses one. For profinite groups with an arbitrary closed kernel a section does exist
  (Ribes–Zalesskii Prop. 2.2.2), but the finite-kernel case is elementary and is all that is
  used.
- **Cocycles and extensions.** From a continuous normalized `2`-cocycle build the extension
  on `M × G` with the twisted multiplication, and check that the product topology makes it
  profinite. From a continuous normalized section build a continuous normalized cocycle. The
  two constructions are mutually inverse up to equivalence of extensions.
  *Needs:* PC-2 the explicit low degrees; L5 sections.
- **The bijection.** Equivalence classes of extensions correspond to `H²(G, M)`, with the
  trivial class corresponding to the semidirect product, naturally in `M`. State it as a
  bijection of sets. The Baer sum is not needed and is not a target.
  *Needs:* L5 cocycles and extensions.
- **Splitting.** An extension has a continuous group-theoretic section if and only if its
  class in `H²(G, M)` is zero.
  *Needs:* L5 the bijection.
The passage from the extension dictionary to projectivity is six statements, and each one is a
milestone of its own below rather than a line in a proof of the last. `Suggested.lean` names all
six, so the dependency graph closes without prose.

- **5.1 The finite embedding problem.** A finite embedding problem for `G` is a continuous
  surjection `π : G ↠ Q` onto a finite group together with a surjection `α : E ↠ Q` of finite
  groups; a solution is a continuous `β : G → E` with `α ∘ β = π`. Both are named:
  `FiniteEmbeddingProblem` and `FiniteEmbeddingProblem.IsSolution`.
  *Needs:* L0 profinite foundations; L5 extensions.
  ⚠ Continuity of a homomorphism into a finite discrete group is openness of its kernel, and that
  is how both are written; no field of the problem carries a topology, exactly as in
  `OccursAsFiniteQuotient`.
  ⚠ A solution cannot be made surjective in general, and no statement here says otherwise. With
  `G = C_p`, `Q = 1` and `E = C_p × C_p`, the unique maps form an embedding problem whose
  solutions are the homomorphisms `C_p → C_p × C_p`, none of which is surjective. The Burnside
  criterion certifies that a map already surjective on the Frattini quotient is surjective; it
  cannot supply a missing generator. Everything below needs only the weak form.
- **5.2 Solvability with elementary abelian kernel.** The predicate
  `HasElementaryAbelianSolutions p G`: every finite embedding problem for `G` whose kernel
  `N = ker α` is elementary abelian has a solution. This is the single step that consumes
  cohomology — conjugation makes `N` a `Q`-module, the extension dictionary turns the problem into
  a class in `H²(G, N)`, and vanishing of that class is exactly solvability. If `H²(G, M) = 0` for
  every finite discrete elementary abelian `p`-primary `G`-module `M`, the predicate holds.
  *Needs:* L5 the bijection; L5 splitting.
- **5.3 The lower `p`-central reduction.** A finite `p`-group kernel `N` is filtered by
  `λ_0(N) = N` and `λ_{k+1}(N) = λ_k(N)^p [λ_k(N), N]`, a chain that reaches `1` in finitely many
  steps and whose factors are elementary abelian:
  `exists_pLowerCentral_filtration_of_isPGroup`.
  *Needs:* M `IsPGroup` and the finite lower `p`-central series.
  ⚠ Characteristicity is what makes the reduction work: each `λ_k(N)` is characteristic in `N`,
  hence normal in `E`, which is what makes each factor a `Q`-module. An arbitrary central series
  of `N` need not be stable under conjugation by `E`.
- **5.4 Solvability with `p`-group kernel.** The predicate `HasPGroupSolutions p G`, and the
  induction `hasPGroupSolutions_of_hasElementaryAbelianSolutions` that derives it from 5.2 by
  climbing the filtration of 5.3, one extension of the kind in the dictionary per step. 5.3 is
  used here and nowhere else, which is why it is stated separately.
  *Needs:* L5.1, L5.2, L5.3.
- **5.5 Compatible systems of finite solutions.** For a surjection `α : A ↠ B` of pro-`p` groups
  and a continuous `f : G → B`, each open normal `U ≤ A` cuts out a finite embedding problem
  `levelProblem … U` with `E = A/U` and `Q = B/α(U)`. Every one of them is solvable by 5.4, its
  solution set is finite, and the transition maps between levels are surjective:
  `nonempty_isSolution_levelProblem`.
  *Needs:* L5.4; L0 open normal subgroups.
  ⚠ Nonemptiness level by level is not what the compactness lemma consumes. It needs a **directed
  family of nonempty closed** subsets, so finiteness of each level set and surjectivity of the
  transitions belong to this milestone rather than to the proof of the next.
- **5.6 Inverse-limit lifting: projectivity.** The predicate `IsProjective p G` — every continuous
  map into a pro-`p` quotient lifts — and `isProjective_of_hasPGroupSolutions`, which assembles
  the compatible finite solutions of 5.5 into one continuous lift by the Layer 0 compactness
  lemma. This is the projectivity statement Layer 6 consumes.
  *Needs:* L0 compactness lemma; L5.5.
- **`H²` of a free pro-`p` group vanishes.** For `F` free pro-`p` of finite rank and `M`
  finite discrete `p`-primary, `H²(F, M) = 0`. Proof: by the dictionary a class is an
  extension `1 → M → E → F → 1`, and the universal property of `F` lifts a generating tuple
  through `E ↠ F`, which produces a continuous group-theoretic section, so the class is
  zero. This theorem is proved here, because the relation-rank theorem below uses it. Layer
  6 restates it as `cd_p F ≤ 1` and proves the converse.
  *Needs:* L5 the dictionary; L4 universal property.
  *Source:* Serre, *Galois Cohomology* I §3.4; Koch Ch. 4.12.

#### Rank interpretations

- **`H¹` interpretation.** `H¹(G, 𝔽_p) ≅ Hom_cont(G, 𝔽_p) ≅ (G/Φ(G))^∨`, so
  `dim_{𝔽_p} H¹(G, 𝔽_p) = topologicalGeneratorRankNat G h` for topologically finitely
  generated pro-`p` `G`. The cardinal form without finiteness is the Layer 3 identity: that
  identity is already stated against the discrete dual, so this layer only identifies the
  dual with `H¹(G, 𝔽_p)`.
  *Needs:* L5 the coefficient objects; PC-3 the degree-one comparison; L3 Burnside.
  *Source:* Labute §1.3; Serre, *Galois Cohomology* I §4.2; NSW (3.9.1).
- **`H²` interpretation.** For a minimal presentation `1 → R → F → G → 1` of a topologically
  finitely generated pro-`p` group, transgression `H¹(R, 𝔽_p)^F → H²(G, 𝔽_p)` is an
  isomorphism, by the five-term sequence and the vanishing theorem above. The space
  `H¹(R, 𝔽_p)^F` is dual to `R/Rᵖ[R,F]`, whose dimension is the least number of
  generators of `R` as a closed normal subgroup. Hence `r(G) = dim H²(G, 𝔽_p)` counts
  relations, and does not depend on the minimal presentation. This is the
  presentation-independence theorem.
  *Needs:* PC-5 the five-term sequence; L5 vanishing theorem; L5 presentations.
  *Source:* Labute §1.4; NSW (3.9.5).
- **Deficiency and one-relator groups.** For pro-`p` `G` that is topologically finitely
  generated with `H²(G, 𝔽_p)` finite-dimensional, both `d(G)` and `r(G)` are natural
  numbers, and `def(G) : ℤ` is defined by `d(G) = def(G) + r(G)`, so that no truncated
  natural subtraction occurs. A finite relation system exists if and only if `H²` is finite,
  and then `#S - #R ≥ d - r` as an inequality in `ℤ`, with equality for minimal
  presentations. The case `r(G) = 1` is the one-relator case, and a Demushkin group is a
  one-relator pro-`p` group with relator in `Fᵖ[F,F]`, which is the input to Layer 7.
  *Needs:* L5 rank interpretations.
  *Source:* NSW (3.9.4).
- **The Golod–Shafarevich inequality.** For a nontrivial finite `p`-group, `4 r(G) > d(G)²`,
  stated in that form over `ℕ`. It is the classical result on deficiency, and it explains
  why a finite `p`-group needs many relations.
  *Needs:* L5 rank interpretations.
  *Source:* NSW (3.9.7); Ribes–Zalesskii Thm. 7.8.5.
- **Sanity example.** `d((ℤ/p)ⁿ) = n` and `r((ℤ/p)ⁿ) = n(n+1)/2`. This count detects a wrong
  normalization of `H²`.
  *Needs:* L5 rank interpretations.

### Layer 6: cohomological dimension of pro-`p` groups

`cd_p G` is `ProfiniteCohomology.cd_p p G`: the infimum, in `ℕ∞`, of the `n` for which
`H^m(G, M)` vanishes for every `m > n` and every discrete `p`-primary torsion `G`-module `M`.
That declaration belongs to the Profinite Cohomology roadmap, and this roadmap defines no second
cohomological dimension. Three reduction theorems say when a smaller test suffices, and none of
them is the definition:

- testing only the **finite** discrete `p`-primary modules gives the same predicate, by
  compatibility with filtered colimits of coefficients. This is
  `ProfiniteCohomology.cd_p_le_iff_finite_pPrimary`, which is cited and not restated;
- testing only the modules of **bounded exponent** gives the same predicate, for the same
  reason. This is `ProfiniteCohomology.cd_p_le_iff_boundedExponent`;
- for a pro-`p` group, testing the single module `𝔽_p` gives the same predicate, by the
  dévissage below. This one is owned here, as `cd_p_le_iff_elementaryAbelian_of_isProP`,
  because its proof is the pro-`p` trivial-filtration theorem of this layer.

Writing the elementary abelian test as the definition would make the dévissage vacuous and
would not agree with the standard `cd_p`.

- **The trivial-filtration theorem.** For pro-`p` `G`, a nonzero finite discrete `p`-primary
  `G`-module has nonzero invariants: the action factors through a finite `p`-quotient, and a
  finite `p`-group acting on a nonzero finite `p`-group fixes a nonzero element. Iterating,
  every such `M` has a `G`-stable filtration whose factors are one-dimensional with trivial
  action. Hence a `ℤ`-valued function of the coefficients that is additive along short exact
  sequences takes the value `length M` times its value at `𝔽_p`, where
  `length M = padicValNat p (Nat.card M)` is the composition length.
  *Needs:* M `IsPGroup.card_modEq_card_fixedPoints`; L3 `IsProP` API.
  ⚠ Do not write `dim_{𝔽_p} M` here. A finite `p`-primary module is not an `𝔽_p`-vector
  space in general, and `ℤ/p²` is the smallest counterexample. The two agree exactly when
  `M` is killed by `p`. That is the case the Euler formulas use, since they take
  `M = 𝔽_p[G/U]`, where `length = dim_{𝔽_p} = [G : U]`.
- **Dévissage.** For a pro-`p` group, vanishing on the finite discrete elementary abelian
  `p`-primary modules in one degree gives vanishing on all finite discrete `p`-primary
  modules in that degree. Route: the trivial-filtration theorem above, and the long exact
  sequence in that degree.
  *Needs:* L6 trivial filtration; PC-5 the long exact sequence.
  *Source:* Serre, *Galois Cohomology* I §3.
- **Vanishing in one degree gives vanishing above it.** If `H²(G, M) = 0` for every finite
  discrete `p`-primary `G`-module `M`, and `G` is pro-`p`, then `H^n(G, M) = 0` for every
  `n ≥ 2` and every such `M`. Route: dimension shifting through `Coind_1^G M`, which uses
  Shapiro for the **closed** trivial subgroup, the long exact sequence for coefficients that
  are not finite, and the dévissage above. This is the theorem that turns the Layer 5
  vanishing theorem for free pro-`p` groups into `cd_p ≤ 1`.
  *Needs:* L6 dévissage; PC-7 `Coind`, `shapiroIso` for a closed subgroup; L6 dimension shifting.
  *Source:* Serre, *Galois Cohomology* I §3.1; Ribes–Zalesskii 7.7.4.
- **Free implies `cd ≤ 1`.** Layer 5's theorem `H²(F, M) = 0`, for `F` free pro-`p` of
  finite rank and `M` finite discrete `p`-primary, restated as `cd_p F ≤ 1`
  (`cd_p_freeProP_le_one`). Dévissage
  changes the coefficients and the vanishing theorem above changes the degree, so the proof
  needs both.
  *Needs:* L5 vanishing theorem; L6 dévissage; L6 vanishing in one degree gives vanishing
  above it.
- **Serre's theorem: `cd_p G ≤ 1` implies free pro-`p`,** for topologically finitely
  generated `G` (`isFree_of_cd_p_le_one`). The route has four steps:
  1. `cd_p G ≤ 1` gives the projectivity property of Layer 5;
  2. a minimal generating tuple gives a continuous surjection `φ : F ↠ G`, from the free
     pro-`p` group on `Fin (topologicalGeneratorRankNat G h)`;
  3. projectivity gives a continuous homomorphic section `s : G → F`;
  4. the image `s(G)` is closed and maps onto `F/Φ(F)` by minimality, so `s(G) = F` by
     Burnside, and `φ` is an isomorphism.
  *Needs:* L5 projectivity; L3 Burnside; L4 free objects.
  *Source:* NSW III §5; Serre, *Galois Cohomology* I §4.2; Ribes–Zalesskii Ch. 7.
  ⚠ The version without finite generation is a different theorem with a different proof. It
  is stated in Layer 10, once free objects on a basis that converges to `1` exist.
- **`cd` of open subgroups.** For `U` open in pro-`p` `G` with `cd_p G < ∞`,
  `cd_p U = cd_p G` (`cd_p_eq_of_isOpen`).
  ⚠ The imported `ProfiniteCohomology.cd_p_eq_of_index_not_dvd` is the case of an open subgroup
  of index **prime to `p`**, which for pro-`p` `G` means `U = G`. It does not prove this
  milestone.
  *Needs:* PC-11 `cd_p_le_of_isClosed`; PC-7 closed-subgroup Shapiro; L6 dévissage.
  *Source:* Serre, *Galois Cohomology* I §3.3.
- **The Sylow equality.** Let `G` be profinite, and let `G_p` be a `p`-Sylow subgroup of `G`,
  from Layer 2. Then `cd_p G = cd_p G_p`. The route has three steps. First, prove the colimit
  description: the cohomology of a closed subgroup, with discrete coefficients, is the
  filtered colimit of the cohomology of the open subgroups containing it. That description is
  part of this milestone. Second, for open `U ⊇ G_p` the composite of corestriction after
  restriction is multiplication by `[G : U]`, and the Sylow property makes those indices prime
  to `p`. With the colimit, restriction to `G_p` is therefore injective on the cohomology of
  every discrete `p`-primary module, which gives `cd_p G ≤ cd_p G_p`. Third, Shapiro's lemma
  for the closed subgroup `G_p` gives `cd_p G_p ≤ cd_p G`. This is the one milestone here
  about `cd_p` of a group that need not be pro-`p`, and it is named `cd_p_eq_of_isProPSylow`.
  ⚠ A `p`-Sylow subgroup is closed and, unless it is open, is not covered by the imported
  `ProfiniteCohomology.cd_p_eq_of_index_not_dvd`. That theorem is the open prime-to-`p`-index
  case, and it supplies exactly the open subgroups `U ⊇ G_p` of prime-to-`p` index; the colimit
  description of the cohomology of a closed subgroup and the Sylow theory of Layer 2 are what
  turn those into the equality, and they are the part this milestone proves.
  *Needs:* L1 supernatural index; L2 Sylow existence and conjugacy; PC-10 `corestriction`,
  `corestriction_comp_res`; PC-11 `cd_p_eq_of_index_not_dvd`; PC-7 closed-subgroup Shapiro.
  *Source:* NSW (3.3.6); Serre, *Galois Cohomology* I §3.3.
- **The two-term Euler formula.** Let `G` be a topologically finitely generated pro-`p`
  group with `cd_p G ≤ 1`, and let `U ≤ G` be open. Then the four spaces
  `H^i(G, 𝔽_p)` and `H^i(U, 𝔽_p)`, for `i = 0, 1`, are finite-dimensional, and in `ℤ`

  > `finrank H⁰(U, 𝔽_p) - finrank H¹(U, 𝔽_p)
  >   = [G : U] · (finrank H⁰(G, 𝔽_p) - finrank H¹(G, 𝔽_p))`.

  Subtraction is in `ℤ` throughout, and no symbol `χ` is introduced. Finite-dimensionality
  is part of the theorem: it follows from topological finite generation of `U`, by Layer 3
  and the `H¹` interpretation of Layer 5. The proof uses Shapiro for `U`, the identification
  `Coind_U^G 𝔽_p ≅ 𝔽_p[G/U]`, the long exact sequence, the trivial-filtration theorem, and
  additivity of `finrank` along a finite exact sequence of finite-dimensional vector spaces.
  *Needs:* PC-7 Shapiro; PC-5 the long exact sequence; L6 trivial filtration; L3 Schreier bound;
  M `Module.finrank`.
- **Pro-`p` Nielsen–Schreier for open subgroups.** An open subgroup `U` of index `m` in a
  free pro-`p` group `F` of finite rank `n ≥ 1` is free pro-`p` of rank `1 + m(n - 1)`
  (`Suggested.lean`). The route is cohomological: freeness from `cd_p U ≤ cd_p F ≤ 1` and
  Serre's theorem; the rank from the two-term Euler formula with `finrank H⁰ = 1`,
  `finrank H¹(F, 𝔽_p) = n` and `finrank H¹(U, 𝔽_p) = d(U)`, which gives
  `1 - d(U) = m(1 - n)` in `ℤ`, hence `d(U) = 1 + m(n-1)` in `ℕ`. The last rearrangement is
  a separate small lemma, because that is where the natural-number statement is recovered.
  *Needs:* L6 Euler formula, L6 Serre's theorem, L6 `cd` of open subgroups.
  *Source:* Koch Example 6.3, derived the same way from his §5.4. The alternative in the
  literature is Ribes–Zalesskii Thm. 3.6.2, a Schreier-transversal argument through the
  pro-`C` completion of the abstract theorem, for extension-closed varieties. This roadmap
  takes the cohomological route, because Layers 5 to 7 build its ingredients anyway, and
  because the closed-subgroup case in Layer 10 is cohomological in any treatment.
  ⚠ Closed subgroups that are not open are Layer 10. Such a subgroup is free pro-`p` of
  possibly infinite rank, and the statement needs bases that converge to `1`. Do not state a
  truncated finite-rank version here.

### Layer 7: Demushkin groups, their invariants, and the orientation

- **The predicate.** `IsDemushkin p G` has the fields given in the conventions: `IsProP p G`,
  finite-dimensionality of `H¹(G, 𝔽_p)`, `finrank H²(G, 𝔽_p) = 1`, and nondegeneracy of
  the cup pairing on each side. Four things are derived at once:
  - `G` is topologically finitely generated, from the first two fields and Burnside;
  - the rank `n(G) := topologicalGeneratorRankNat G h`, which `Suggested.lean` packages as
    `demushkinRank`;
  - the identity `n(G) = finrank H¹(G, 𝔽_p)`;
  - `G` is a one-relator pro-`p` group, with relator in `Fᵖ[F,F]`.

  Also proved here: `IsDemushkin` is invariant under topological isomorphism. Every
  numerical statement below is about `demushkinRank`.
  *Needs:* L5 the coefficient objects and `cupFp`; L5 rank interpretations; L3 Burnside.
  *Source:* Labute p. 106.

  API checklist for `IsDemushkin`:
  - Constructors: from the four fields and from the recognition criteria below.
  - Examples: `ℤ/2` at `p = 2`; `ℤ_p × ℤ_p` with `q = 0`; `D₀` at `p = 2` with `n = 3`; the
    non-examples `1`, `ℤ_p` and every free pro-`p` group.
  - Morphisms: topological isomorphisms transport the predicate; open subgroups inherit it,
    which is the open-subgroup theorem below.
  - Functoriality: the invariants `demushkinRank` and `Im (demushkinCharacter)` are
    invariant under topological isomorphism.
  - Comparison lemmas: the recognition criteria below give equivalent conditions for a
    one-relator group; the definition agrees with Labute's and with NSW (3.9.9).
  - Naturality: restriction of the canonical character to an open subgroup is the canonical
    character of that subgroup.
  - Edge cases: rank 1, where only `ℤ/2` occurs; `q = 2`, where `(n, q)` is not a complete
    invariant; finite Demushkin groups, where only `ℤ/2` occurs.
  - Downstream interfaces: the classification of Layer 9 and `LocalGaloisGroups`.
- **First examples and non-examples.** `ℤ/2` is Demushkin at `p = 2`, is the unique finite
  one, and is the unique one of rank 1; the cup square of the generator of `H¹(ℤ/2, 𝔽₂)`
  is the class of the extension `ℤ/4`. A free pro-`p` group is not Demushkin, because its
  its `H²` vanishes; this covers `1` and `ℤ_p`. The group `ℤ_p × ℤ_p` is Demushkin with
  `q = 0`, with the surface relation `(x₁, x₂)`. For odd `p` there is no Demushkin group of
  rank 1.
  *Needs:* L7 the predicate; L5 the coefficient objects.
  *Source:* Labute p. 106; Serre, *Galois Cohomology* I §4.5.
- **The abelianization structure theorem.** For Demushkin `G`,
  `G^{ab} ≅ ℤ_p^{n-1} × ℤ_p/qℤ_p`, proved from the Layer 4 structure theorem applied to
  `topAbelianization G`, together with the one-relator presentation. The torsion subgroup is
  finite and cyclic, which is what makes `demushkinQ G` well defined from the predicate
  alone: it is `0` when the torsion is trivial, and the order of the torsion otherwise.
  Worked instance: `D₀^{ab} ≅ ℤ₂² × ℤ/2`, its torsion is finite, and `q(D₀) = 2`
  (`Suggested.lean`). That instance is a computation with the presentation, and it does not
  use the classification.
  *Needs:* L4 structure theorem; L5 presentations; L7 the predicate.
  *Source:* Labute p. 106.
- **The prescription property.** For a continuous character `χ : G → ℤ_pˣ`, write
  `I(χ)/p^i` for `ℤ/p^i` with action `g · x = χ(g)x`. When
  `dim H¹(G, 𝔽_p) < ∞`, the following three conditions are equivalent (Labute Prop. 6):
  1. the reduction map `H¹(G, I(χ)/p^i) → H¹(G, I(χ)/p)` is surjective for every
     `i ≥ 1`;
  2. `H²(G, I(χ)/p^i) → H²(G, I(χ)/p^{i-1})` is injective for every `i ≥ 2`,
     equivalently the connecting map
     `H¹(G, I(χ)/p^{i-1}) → H²(G, I(χ)/p)` is zero;
  3. for a minimal generating tuple `g₁, …, g_n` and every
     `(c₁, …, c_n) ∈ ℤ_p^n`, there is a compatible inverse system of continuous crossed
     homomorphisms to `I(χ)/p^i` taking `g_j` to `c_j mod p^i`.

  `HasPrescriptionProperty` uses condition 1. The finite coefficient modules are primary;
  a crossed homomorphism valued directly in `I(χ)` is introduced only after constructing
  the inverse limit. This equivalence is the bridge from Kummer-compatible finite
  coefficients in downstream arithmetic applications to the marked character values used
  by the abstract classification.
  *Needs:* L5 coefficient objects; PC-5 connecting maps and exactness.
  *Source:* Labute Prop. 6.
- **The canonical character.** For `dim H¹(G, 𝔽_p) < ∞` the three prescription conditions
  above are equivalent, and a free pro-`p` group satisfies them for every `χ`.
  **Theorem.** A Demushkin group has exactly one continuous `χ : G → ℤ_pˣ` with the
  prescription property. Define `demushkinCharacter G` to be that character. Prove that its
  image is closed, and that it is invariant under topological isomorphism; the second
  statement is the transport lemma that the acceptance instances use. Prove
  `Im χ = 1 + q(G)ℤ_p` only in the case `q(G) ≠ 2`. For `q(G) = 2` keep `Im χ` as a separate
  invariant, and do not recover `q` from a containment.
  *Needs:* L5 the coefficient objects; PC-1 `coeffMap`; L7 the predicate; L4 `ℤ_p` chain.
  *Source:* Labute Prop. 6 and Thm 4.
- **The closed subgroups of `ℤ₂ˣ`.** This item is `ℤ_pˣ`-theory, with no cohomology. Named
  definitions first, for `f : ℕ∞` with `f ≥ 2`:
  - `U^(f) := 1 + 2^f ℤ₂`, with `U^(∞) = {1}`;
  - `V^(f) := {±1} × U^(f)`, the subgroup generated by `-1` and `U^(f)`, with
    `V^(∞) = {±1}`;
  - `U^[f] := closure ⟨-1 + 2^f⟩` for `2 ≤ f < ∞`.

  Then:
  - **Exhaustiveness and uniqueness.** Every nontrivial closed subgroup of `ℤ₂ˣ` is exactly
    one of `U^(f)` for `2 ≤ f < ∞`, `V^(f)` for `2 ≤ f ≤ ∞`, and `U^[f]` for `2 ≤ f < ∞`,
    and no two entries of that list are equal. `U^(∞) = {1}` is trivial, so it is not in the
    list, although it is a legitimate value of the `f = ∞` convention elsewhere: it is the
    image of `χ` for a free pro-`2` group. Route: `ℤ₂ˣ = {±1} × (1 + 4ℤ₂)`, with
    `1 + 4ℤ₂ ≅ ℤ₂` through the logarithm, so the closed subgroups of the second factor are
    the `1 + 2^fℤ₂`; the three families are the three ways a closed subgroup sits over
    `{±1}`. In `Suggested.lean` the families are indexed by `f : ℕ`, and the members at
    `f = ∞` are written separately, because an `ℕ∞`-indexed definition would carry a junk
    value at `∞`.
  - **Procyclicity.** `U^(f)` and `U^[f]` are procyclic. `V^(f)` with `f < ∞` is not,
    because its Frattini quotient is `(ℤ/2)²`. Equivalently, a closed subgroup is procyclic
    if and only if it does not contain `-1` together with a nontrivial element of `1 + 4ℤ₂`;
    that is the form in `Suggested.lean`.
  - **Indices and intersections.** `profiniteIndex U^(f) ℤ₂ˣ = 2^{f-1}`,
    `profiniteIndex V^(f) ℤ₂ˣ = 2^{f-2}`, `profiniteIndex U^[f] ℤ₂ˣ = 2^{f-1}`, and
    `U^[f] ∩ (1 + 4ℤ₂) = U^(f+1)`. For the last one, the generator `g = -1 + 2^f` has
    `g² = 1 - 2^{f+1}u` with `u = 1 - 2^{f-1}` odd, so the even powers of `g` are exactly
    `U^(f+1)`, and that intersection is what gives the index. In the notation of Layer 8,
    `(A : A²) = 2` for `U^(f)` and for `U^[f]`, and `(A : A²) = 4` for `V^(f)` with
    `f < ∞`. Check these at `f = 2, 3, 4` by squaring: a shift of one in this exponent
    changes the parametrization of the whole `q = 2` classification.
  - **Odd `p`.** For odd `p`, `ℤ_pˣ ≅ μ_{p-1} × (1 + pℤ_p)`, and the closed subgroups of
    `1 + pℤ_p` are exactly the `1 + p^fℤ_p`. The proof uses the `p`-adic logarithm with its
    domain restricted to `1 + pℤ_p`, where it is an isomorphism of topological groups onto
    `pℤ_p`. The restriction of the domain is part of the statement: the logarithm does not
    converge on all of `ℤ_pˣ`.
  - **Which subgroups occur as images.** For each normal form of Layer 9, the closed
    subgroup generated by the character values on the normal-form basis, computed
    explicitly. The marked classification reads its values from this table.

  *Needs:* L1 index; M `PadicInt`, M `PadicInt.toZModPow`, M the `p`-adic logarithm.
  *Source:* the remark after the corollary to Labute Thm 4.

#### Demushkin duality, concretely

A general theory of profinite duality groups, dualizing modules and `PD^n` is not built
here, and the terms do not occur in any milestone. What Layers 9 and 11 use is a small
package of statements about finite discrete modules, and that package is stated here.

- **Dimension two.** An infinite Demushkin group has `cd_p G = 2`
  (`cd_p_eq_two_of_isDemushkin`). Route: `≤ 2` from the one-relator presentation and the
  five-term sequence; `≥ 2` from `H²(G, 𝔽_p) ≠ 0`, which is part of the definition.
  *Needs:* L6 `cd_p`; PC-6 `transgression`, `fiveTerm_exact_H1N`, `fiveTerm_exact_H2Q`; L7 the
  predicate.
  *Source:* Tate, in Serre, *Structure de certains pro-p-groupes*, §9.1.
- **The trace isomorphism.** Fix the isomorphism `tr : H²(G, 𝔽_p) ≅ 𝔽_p` determined by a
  choice of nonzero element. The choice is unique up to `𝔽_pˣ`; name a generator, and record
  that the statements below do not change under rescaling. Every pairing below is normalized
  through `tr`.
  *Needs:* L7 the predicate.
- **The perfect pairings that are used.** For each `i ≥ 1` and each finite discrete
  `p`-primary `G`-module `M` in the coefficient system `I(χ)/p^i` of the canonical
  character, the cup pairing
  `H^j(G, M) × H^{2-j}(G, M^∨(χ)) → H²(G, I(χ)/p^i) ≅ ℤ/p^i` is a perfect pairing
  of finite abelian groups for `j = 0, 1, 2`, where `M^∨(χ) := Hom(M, I(χ)/p^i)` carries the
  diagonal action. Only the modules of that system are claimed, because only they are used.
  There is no unqualified statement about all finite discrete modules in this roadmap.
  *Needs:* L5 the coefficient objects and `cupFp`; L7 trace and canonical character.
  *Source:* Serre, *Structure de certains pro-p-groupes*, §9.
- **Naturality.** Compatibility of the pairings with restriction to an open subgroup and
  with corestriction, in the form `⟨res a, b⟩_U = ⟨a, cor b⟩_G`. These are the two
  compatibilities that the open-subgroup theorem uses.
  *Needs:* L5 change-of-group maps; L7 the pairings.
- **The role of the character.** For `i ≤ i'` the transition maps of the system
  `(I(χ)/p^i)_i` are `G`-equivariant, and the induced action on the compatible system of
  duals `Hom(𝔽_p, I(χ)/p^i)` is by `χ` modulo `p^i`. This is the precise sense in which `χ`
  controls the duality. The inverse limit `ℚ_p/ℤ_p` is not a coefficient module of any
  statement here.
  *Needs:* L7 canonical character; L5 the coefficient objects.
- **The three-term Euler formula.** For `G` topologically finitely generated pro-`p` with
  `cd_p G ≤ 2`, **with `H^i(G, 𝔽_p)` finite-dimensional for `i = 0, 1, 2`**, and `U ≤ G`
  open: the six spaces are finite-dimensional and, in `ℤ`,
  `Σ_{i=0}^{2} (-1)^i finrank H^i(U, 𝔽_p)
   = [G : U] · Σ_{i=0}^{2} (-1)^i finrank H^i(G, 𝔽_p)`.
  The proof has the shape of the two-term case, one degree longer, with the same inputs:
  Shapiro, the long exact sequence, and the trivial-filtration theorem of Layer 6.
  Finiteness for `U` is part of the conclusion and follows from the hypothesis for `G`
  through Shapiro; finiteness for `G` is a hypothesis, and not a consequence. Substituting
  `finrank H⁰ = finrank H² = 1` for a Demushkin group gives the rank formula.
  ⚠ Topological finite generation bounds `H⁰` and `H¹` only. It does not bound `H²`, whose
  dimension is the relation rank, so the finiteness hypothesis is not redundant: a
  topologically finitely generated pro-`p` group need not be finitely presented. For a
  Demushkin group the hypothesis holds, since `dim H² = 1` is part of the definition, and
  that is the case the open-subgroup theorem uses.
  *Needs:* PC-7 Shapiro; PC-5 the long exact sequence; L6 trivial filtration.
- **The open-subgroup theorem.** For `G` infinite Demushkin and `U ≤ G` open: `U` is
  Demushkin; `n(U) - 2 = [G : U](n(G) - 2)` in `ℤ`; and
  `demushkinCharacter U = (demushkinCharacter G) ∘ (inclusion U)`. Route: `cd_p U = 2` from
  Layer 6; `finrank H²(U, 𝔽_p) = 1` from the perfect pairing and naturality; nondegeneracy
  on `U` likewise; then the three-term Euler formula below.
  *Needs:* L6 `cd` of open subgroups; L7 pairings and naturality; L7 Euler formula.
  *Source:* Serre, *Structure de certains pro-p-groupes*, §9.2.
  ⚠ The hypothesis "infinite" is used: `ℤ/2` is Demushkin and finite, and the rank formula
  fails for it.
- **Recognition criteria.** For a topologically finitely generated one-relator pro-`p` group
  `G` with `n(G) > 1`, the following are equivalent:
  1. `G` is Demushkin;
  2. `cd_p G = 2` and `finrank H²(N, 𝔽_p) = 1` for every open normal `N ≤ G`;
  3. `cd_p G = 2` and `n(N) - 2 = [G : N](n(G) - 2)` in `ℤ` for every open normal `N ≤ G`.

  The sharpened forms, in which `N` ranges only over the open normal subgroups of index `p`,
  are separate statements with the same proof. These are exported as abstract recognition
  criteria for downstream consumers.
  *Needs:* L7 open-subgroup theorem; L6 `cd`.
  *Source:* NSW (3.9.15), due to Andozhskii and to Dummit–Labute. NSW also lists an
  equivalent condition phrased through a dualizing module; that formulation needs vocabulary
  this roadmap does not define, so it is not among the equivalences here.

### Layer 8: the central-tower comparison method and finite-quotient determinacy

This layer states the classification method as a theorem about a finite inverse system, and
not as a description of a technique. Two pro-`p` groups are compared through the finite
quotients of the lower `p`-series, and the comparison is then assembled. Nothing in this
layer is cohomological.

#### Notation, fixed for Layers 8 and 9

Every symbol used in the two hardest layers is declared here. Where Labute's indexing
differs, the translation is stated once.

- `λ_k := pLowerCentralSeries p G k`, 0-based: `λ_0 = G` and
  `λ_{k+1} = closure (λ_kᵖ ⬝ [λ_k, G])`. Labute's `F_i` is 1-based with `F_1 = F`, so his
  `F_i` is our `λ_{i-1}`, and his `F_3`, the modulus of the normal-form congruences, is our
  `λ_2`. Every Labute index below is translated in place.
- `gr_k(G) := λ_k / λ_{k+1}`, a profinite elementary abelian `p`-group, that is a profinite
  `𝔽_p`-vector space, written additively; `Suggested.lean` names it `gradedPiece` and takes
  `Additive` of the group quotient, so that the additive notation of this layer is the Lean
  notation too. Normality of `λ_{k+1}` inside `λ_k` is a milestone of this layer, and it is a
  hypothesis of every statement about `gradedPiece`. `gr(G) := ⨁_{k ≥ 0} gr_k(G)`.
  ⚠ `gr_k(G)` is **finite** only under topological finite generation, and that is a theorem:
  `IsTopologicallyFinitelyGenerated G → Finite (gr_k G)`, proved from openness of
  `λ_{k+1}`. Without it the statement is false, since `G = ∏_I C_p` with `I` infinite has
  `λ_1(G) = 1` and `gr_0(G) = G`. Every span statement, basis correction and dimension count
  below is therefore stated for a free pro-`p` group of finite rank, or for another group
  that is explicitly topologically finitely generated.
- The **bracket** `gradedBracket : gr_j × gr_k → gr_{j+k+1}`, induced by the group commutator;
  the degree shifts by one because the indexing is 0-based, since `[λ_j, λ_k] ≤ λ_{j+k+1}`. The
  **`p`-power operator** `gradedPow : gr_k → gr_{k+1}` is `π(x λ_{k+1}) = x^p λ_{k+2}`. Both are
  named maps and not existence statements, and each carries its defining equation on classes,
  `gradedBracket_mk` and `gradedPow_mk`; the two degree-raising membership statements
  `commutator_mem_pLowerCentralSeries` and `pow_mem_pLowerCentralSeries` are what make them well
  defined. The laws are `gradedBracket_bilinear`, `gradedBracket_alternating`,
  `gradedBracket_jacobi`, `gradedPow_add_of_pos` and `gradedPow_add_of_odd`; a continuous
  homomorphism induces `gradedMap`, compatible with both operations by `gradedBracket_natural`
  and `gradedPow_natural`. The operator `π` commutes with scalars, and it is additive in every
  degree except degree zero at `p = 2`.
  *Source:* Labute Prop. 1 and Prop. 2, in our indexing.
- **`π` against the bracket, and the dyadic failure.** For every `p` the bracket is
  `π`-bilinear away from degree zero: `π[x, y] = [πx, y] = [x, πy]` for `x ∈ λ_j` and
  `y ∈ λ_k` with `j, k ≥ 1`, all three terms lying in `gr_{j+k+2}`. The group identities
  behind this are `[x², y] = [x, y]²·[[x, y], x]` and `[x, y²] = [x, y]²·[[x, y], y]`, whose
  correction terms have degrees `2j + k + 2` and `j + 2k + 2`, so they vanish in
  `gr_{j+k+2}` unless the corresponding argument has degree zero. For odd `p` the operator
  `π` is additive as well, because the Hall–Petrescu corrections carry coefficients
  `binom(p, i)` that are divisible by `p`, and the degree-zero corrections vanish too; hence
  `gr(G)` is a graded Lie algebra over `𝔽_p[π]`, with `π` of degree one.
  **For `p = 2` additivity fails in degree zero.** The exact failure is
  `π(x + y) = π(x) + π(y) + [x, y]` in `gr_1(G)`, for `x, y ∈ gr_0(G)`, which is the
  `binom(2, 2)` term of the Hall–Petrescu expansion. That equation is the milestone
  `gradedPow_add_zero_dyadic`, stated literally and not as a description. In degree zero the bracket identities
  also acquire the correction `[πx, y] = π[x, y] + [[x, y], x]`, and its mirror image. So
  `gr(F)` for free pro-`2` `F` is not an `𝔽_2[π]`-Lie algebra. The milestones are proofs of
  these identities, `gradedPow_bracket_left` and `gradedPow_bracket_right` away from degree
  zero, with a witness that the failure is not vacuous: in `F` free pro-`2` of rank 2,
  `[x̄₁, x̄₂] ≠ 0` in `gr_1(F)`, which is `gradedBracket_freeProP_two_ne_zero`, so `π` is not
  additive on `gr_0(F)`. Every `q = 2` argument downstream has this shape.
  *Needs:* L8 the graded object; M the commutator identities.
- **Openness and cofinality** (`Suggested.lean`). In a topologically finitely generated
  pro-`p` group every `λ_k` is open, by induction, and the series is a neighbourhood basis
  of `1`, so `G ≅ lim_k G/λ_k` with finite `p`-group levels and any comparison runs level by
  level. Each `λ_k` is closed, normal and characteristic, with `λ_{k+1} ≤ λ_k`. A continuous
  homomorphism satisfies `f(λ_k(G)) ≤ λ_k(H)`, with equality when `f` is surjective.
  *Needs:* L3 Frattini theory and finite generation; L0 inverse limits.
  *Source:* Ribes–Zalesskii Prop. 2.8.13 states the same for the iterated Frattini series;
  prove it for both series, because they interleave.
- **`δ_j`, the basis-modification maps.** Let `F = freeProP p (Fin n)` with basis
  `x_1, …, x_n`, and let `r ∈ λ_1(F)` be a relator; `R` is the closed normal subgroup
  generated by `r`, and `R_j := R ∩ λ_j(F)`. Modifying the basis by `x_i ↦ x_i w_i` with
  `w_i ∈ λ_{j-1}(F)`, for `j ≥ 1`, moves `r` inside its coset by an element of `λ_j(F)`
  whose class in `gr_j(F)` depends only on the classes `w̄_i ∈ gr_{j-1}(F)`. That map is
  `δ_j : gr_{j-1}(F)^{⊕ n} → gr_j(F)`,
  `δ_j(w̄_1, …, w̄_n) = Σ_i [w̄_i, ∂_i r̄] + Σ_i c_i π(w̄_i)`,
  where `r̄ ∈ gr_1(F)` is the class of the relator, `∂_i r̄ ∈ gr_0(F)` is the coefficient of
  `x_i` in the commutator part of `r̄`, and `c_i ∈ 𝔽_p` is the coefficient of `x_i^p` in the
  `p`-power part. Both terms land in `gr_j(F)`: the bracket raises the degree by
  `0 + (j - 1) + 1`, and `π` raises it by one. The image `Im δ_j ≤ gr_j(F)` is the subspace
  in the span statements of Layer 9. Linearity holds in the degrees the span statements use,
  and fails in one case:
  - for `j ≥ 2` the map `δ_j` is `𝔽_p`-linear, because `π` is additive above degree zero;
  - for `j = 1` at `p = 2` with some `c_i ≠ 0`, which is the case of the `q = 2` relators,
    the inputs lie in `gr_0(F)`, where `π(x + y) = π(x) + π(y) + [x, y]`, so `δ_1` is
    quadratic and not additive. Its polarization is
    `δ_1(v + w) - δ_1(v) - δ_1(w) = Σ_i c_i [v_i, w_i]`, and every statement that uses
    `δ_1` at `p = 2` is stated against that corrected map.

  The milestones are well-definedness of `δ_j`, linearity for `j ≥ 2`, the polarization
  identity at `j = 1`, and the explicit formula at a relator in normal form.
  *Needs:* L8 the graded object; L4 free objects.
  *Source:* Labute Prop. 5, in our indexing.
  API checklist for `pLowerCentralSeries` and `gr`:
  - Constructors: the series itself; the class of an element in `gr_k`; the bracket and the
    operator `π`.
  - Examples: `λ_1(G) = Φ(G)`; `gr_0(G) = G/Φ(G)`; `gr(F)` for `F` free pro-`p` of rank `n`,
    where `gr_1(F) ≅ Λ²(𝔽_p^n) ⊕ 𝔽_p^n`.
  - Morphisms: a continuous homomorphism induces a graded map; a continuous surjection
    induces a surjection in each degree.
  - Functoriality: `f(λ_k(G)) ≤ λ_k(H)`, with equality for a continuous surjection; each
    `λ_k` is characteristic.
  - Comparison lemmas: the interleaving with the iterated Frattini series; agreement with
    Mathlib's `lowerCentralSeries` on the commutator part.
  - Naturality: bracket and `π` commute with the induced maps.
  - Edge cases: `p = 2` in degree zero, where `π` is not additive; a group that is not
    topologically finitely generated, where `λ_k` need not be open.
  - Downstream interfaces: `δ_j` and `T_j` below; the comparison schema; the span statements
    of Layer 9.

- **The tails `T_j`.** For `p = 2` the span statements use one further subspace. `T_j` is
  spanned by the iterated `p`-powers `π^j(x̄_i) ∈ gr_j(F)`, over the indices `i` with
  `c_i = 0`, that is over the generators whose exponent in the `p`-power part of the relator
  is not exactly `p`, and which therefore contribute no `π`-term to `δ_j`. For
  `r = x₁²x₂^{2^f}(x₂, x₃)⋯` with `f ≥ 2` these are `x₂, …, x_n`, because `π^f(w̄)` lands in
  `gr_{j+f-1}`, which is above the relevant degree.
  *Needs:* L8 the graded object and `δ_j`.
- **`(A : A²)` and the parameters of the normal forms.** `A ≤ ℤ_pˣ` always denotes a closed
  subgroup, `A²` the closed subgroup of squares, and `(A : A²)` the index
  `profiniteIndex A² A`, which is `1`, `2` or `4` for the closed subgroups of `ℤ₂ˣ`, proved
  from the Layer 7 trichotomy. The parameters of the normal forms are these:
  - `n ≥ 1` is the rank;
  - `f` ranges over `2 ≤ f < ∞` together with `f = ∞`, encoded as `f : ℕ∞` with
    `U^(∞) = {1}` and `2^∞ = 0` in the exponent, so that `x^{2^f}` means `x^0 = 1` at
    `f = ∞`;
  - `α ∈ 4ℤ₂` is a `2`-adic integer with `v₂(α) ≥ 2`, where `α = 0` is allowed and
    `v₂(0) = ∞`;
  - `N` is `n/2`, the number of commutator pairs in an even-rank form.

  Each classification statement repeats the ranges that it uses.
  *Needs:* L7 the trichotomy; L1 index.

#### Finite-quotient determinacy

- **Occurring as a quotient.** `IsFiniteContinuousQuotient G Q`, for a finite group `Q`,
  says that there is a surjection `f : G →* Q` with open kernel (`Suggested.lean`). Phrasing
  it through the kernel, and not through a topology on `Q`, lets statements quantify over
  `Q` bundled as a `FiniteGrp`, and not over arbitrary types with an unspecified topology.
  For a finite discrete `Q` the two conditions agree, and that agreement is a lemma here.
  Also proved here: the predicate depends only on the isomorphism class of `Q`, and only on
  the topological isomorphism class of `G`.
  *Needs:* L0 open subgroups; M `FiniteGrp`.
- **Two epimorphisms.** If `G` is topologically finitely generated, and `G` and `H` have the
  same continuous finite quotients, then there are continuous surjections `G ↠ H` and
  `H ↠ G`. The route has five steps:
  1. `H` is topologically finitely generated, because each of its finite quotients is a
     finite quotient of `G` and so needs at most `d(G)` generators;
  2. for each open normal `N ≤ G` the set `E(N)` of continuous surjections `H ↠ G/N` is
     nonempty, by hypothesis, and finite, by step 1;
  3. for `N' ≤ N` let `E(N', N) ⊆ E(N)` be the image of `E(N')` under composition with
     `G/N' ↠ G/N`; these decrease as `N'` decreases, and each is nonempty and finite, so
     they stabilize at a nonempty set `E∞(N)`;
  4. the `E∞(N)` form an inverse system whose bonding maps **are** surjective, by
     construction, and each is a nonempty finite set;
  5. the Layer 0 compactness lemma gives a compatible family, hence the surjection `H ↠ G`;
     the other direction is symmetric once step 1 is available.

  *Needs:* L0 compactness lemma; L3 finite generation and the Burnside rank bound.
  ⚠ The raw bonding maps on `E(N)` are **not** surjective, so step 3 is not decoration.
  Counterexample: `H = C₄ × C₂` surjects onto `C₂` by the second projection, and that
  surjection does not factor through `C₄ ↠ C₂`, although `H` does surject onto `C₄`.
- **The isomorphism theorem, sharp form.** If `G` is topologically finitely generated, and
  `G` and `H` have the same continuous finite quotients, then `G ≅ H` as topological groups,
  with **no finite-generation hypothesis on `H`**. The route has three steps:
  1. the two epimorphisms give `φ : G ↠ H` and `ψ : H ↠ G`;
  2. `ψ ∘ φ : G ↠ G` is surjective, hence an isomorphism by the Hopf property of Layer 3,
     which needs finite generation of `G` only;
  3. therefore `φ` is injective, and a continuous bijection of compact Hausdorff groups is a
     topological isomorphism.

  Finite generation of `H` is a conclusion, and not a hypothesis. If the two-epimorphism step is
  easier with both hypotheses, state that weaker lemma first, and then the argument that
  removes the second hypothesis.
  *Needs:* L8 two epimorphisms; L3 Hopf property.
  *Source:* Fried–Jarden; Ribes–Zalesskii Thm. 3.2.9.
- **Corollary.** Finitely generated abstract groups with the same finite quotients have
  topologically isomorphic profinite completions.
  *Needs:* L8 the isomorphism theorem; M `ProfiniteGrp.profiniteCompletion`.
  *Source:* Dixon–Formanek–Poland–Ribes 1982; Ribes–Zalesskii Cor. 3.2.8.

#### The levelwise comparison schema

The reusable form of the tower method. The data are:

- topologically finitely generated pro-`p` groups `G` and `H`;
- for each `k : ℕ`, a **finite** type `S k` of level-`k` comparison data;
- realization maps `ρ_k : S k → (G/λ_k → H/λ_k)`, landing in continuous surjective
  homomorphisms;
- bonding maps `β_k : S (k+1) → S k`, each surjective, with each `S k` nonempty;
- compatibility: for every `s : S (k+1)` the square built from `ρ_{k+1} s`, `ρ_k (β_k s)`
  and the two projections commutes.

**Theorem.** Under these hypotheses there is a continuous surjection `Φ : G ↠ H`, and an
element `s∞` of `lim_k S k`, such that `Φ` induces `ρ_k (s∞)_k` on each level. Proof: the
inverse limit of a system of nonempty finite sets with surjective bonding maps is nonempty,
by Layer 0; compatibility makes the induced level maps assemble; surjectivity passes to the
limit by compactness.

*Needs:* L0 compactness lemma; L8 openness and cofinality of the lower `p`-series.

The side conditions of an application, such as prescribed values on marked generators or a
constraint from a character, are carried in the type `S k` itself. An application chooses
`S k` to be the set of level-`k` comparisons that satisfy the conditions, so the hypotheses
to discharge are nonemptiness and surjectivity of the bonding maps. A predicate on the
inverse limit may be imposed as an extra hypothesis, in which case it must be given as a
compatible family of predicates on the `S k`.

Two applications are immediate corollaries:

- the two-sided version, where data in both directions, together with the Hopf property,
  give `G ≅ H`;
- the specialization used in Layer 9, where `S k` is the set of level-`k` basis changes that
  carry one Demushkin relator to another and respect the character.

### Layer 9 prerequisites: two owned inputs

Both are needed by Labute's proof, neither is in Mathlib, and neither is supplied by another
roadmap. They are built here, before the classification, and they are useful on their own.

#### Bilinear forms over `𝔽_p`, including the characteristic-two nonalternating case

Index conventions:

- `V` is a finite-dimensional `𝔽_p`-vector space;
- `b : V →ₗ[𝔽_p] V →ₗ[𝔽_p] 𝔽_p` is a bilinear form, written `b x y`;
- matrices are taken with respect to an ordered basis `e` by `B_{ij} = b (e i) (e j)`, so a
  change of basis `e' = e ⬝ P` acts by `B' = Pᵀ B P`.

- **Basics.** The left and right radicals of `b`; left and right nondegeneracy, which agree
  for finite-dimensional `V`; transport of a form along a linear equivalence, and the
  resulting notion of equivalence of forms.
  *Needs:* M `LinearMap.BilinForm` and its radical API.
- **Alternating, skew-symmetric, symmetric.** `IsAlternating b := ∀ x, b x x = 0`. Expanding
  `b (x + y) (x + y) = 0` shows that alternating implies skew-symmetric, that is
  `b y x = - b x y`, in every characteristic. It does not imply symmetric, except at `p = 2`,
  where skew-symmetric and symmetric are the same condition. At `p = 2` the two conditions
  differ exactly by the diagonal, and `x ↦ b x x` is then `𝔽_2`-semilinear, since it is
  additive with `b (cx) (cx) = c² b x x`. For odd `p` a form that is both symmetric and
  alternating is zero. The forms that occur at odd `p` in this roadmap are the alternating
  ones, because the cup pairing on `H¹(G, 𝔽_p)` is graded-commutative, so `a ∪ a = 0` once
  `2` is invertible.
  *Needs:* L9 basics; L5 `cupFp` and its graded commutativity.
- **Symplectic normal form.** A nondegenerate alternating form on `V` has a basis in which
  the matrix is block diagonal with blocks `[[0, 1], [-1, 0]]`, so `dim V` is even. Stated
  for every `p`, including `p = 2`.
  *Needs:* L9 basics.
  *Source:* standard; Ribes–Zalesskii and NSW use it in this form.
- **Characteristic two, nonalternating.** For `p = 2` and `b` symmetric, nondegenerate and
  not alternating, there is a basis in which the matrix is the identity. Such forms exist in
  every dimension, odd and even, and any two of the same dimension are equivalent. With the
  previous item this is the complete classification of nondegenerate symmetric bilinear
  forms over `𝔽_2`.
  *Needs:* L9 basics.
- **The change-of-basis theorem that Layer 9 uses.** Let `b` be nondegenerate on `V` of
  dimension `n`, and either alternating for any `p`, or symmetric with `p = 2`. Then there
  is a basis in which `B` is one of two matrices:
  - the symplectic block form, if `b` is alternating, and then `n` is even;
  - the identity, if `p = 2` and `b` is symmetric and not alternating, and then `n` is
    arbitrary.

  These are the only two cases that the classification produces. The statement records which
  case each Demushkin normal form falls into, so that the odd-dimensional case at `p = 2` is
  covered explicitly.
  *Needs:* L9 the two normal forms.
  ⚠ Nondegenerate symmetric nonalternating forms in odd characteristic, which are
  diagonalizable and classified by their discriminant, are not part of this prerequisite. No
  cup form of a Demushkin group at odd `p` is one, and nothing below uses them.
- **From the cup matrix to the relator.** Given a relator `r ∈ λ_1(F)` for
  `F = freeProP p (Fin n)`, the coefficients of `r̄ ∈ gr_1(F)` in the standard basis of
  `gr_1(F) ≅ Λ²(𝔽_p^n) ⊕ 𝔽_p^n`, that is in the commutator part and the `p`-power part, are
  the entries `a_{ij}` of the cup matrix off the diagonal, and `(q choose 2) a_i` on it. A
  basis change `P` acts on those coefficients by `B ↦ PᵀBP`, so a normal form for `B` gives
  a relator congruent modulo `λ_2(F)` to the corresponding normal-form word. The hypotheses
  are the two cases above: `B` is alternating exactly when the diagonal entries all vanish,
  which is automatic for odd `p`, and which at `p = 2` holds exactly when `q ≠ 2`; so the
  symmetric nonalternating case is exactly `p = 2` with `q = 2`.
  *Needs:* L9 change-of-basis theorem; L8 the graded object; L5 `cupFp`.
  *Source:* Labute Prop. 3.

#### The completed group algebra of the orientation image

Labute's §1.5 and §4 arguments run over `Λ = ℤ_p[[Γ]]` for `Γ = Im χ`. Two shapes of `Γ`
occur in the dyadic classification, and both are needed:

- `Γ` procyclic, which covers `Im χ = 1 + qℤ_p` for `q ≠ 2` and the branch `Im χ = U^[f]`;
- `Γ ≅ C₂ × ℤ₂`, which is the branch `Im χ = V^(f) = {±1} × U^(f)` with `f < ∞`, and which
  Layer 7 proves is not procyclic.

The package below is stated for the procyclic case first, and then extended to the second
shape. Citing the procyclic package for `V^(f)` is the mistake to avoid: that branch is one
of the two even-rank families in the abstract classification.

- **The algebra.** For a profinite group `Γ` and a prime `p`,
  `completedGroupAlgebra p Γ := lim_U ℤ_p[Γ/U]` over the open **normal** subgroups `U ≤ Γ`,
  with the inverse-limit topology; the subgroups are normal because `Γ/U` has to be a group for
  `ℤ_p[Γ/U]` to be a group algebra. It is a compact topological `ℤ_p`-algebra: `Ring`,
  `Algebra ℤ_[p]`, `TopologicalSpace`, `IsTopologicalRing`, `CompactSpace` and
  `TotallyDisconnectedSpace` are all part of the milestone. **It is commutative exactly when
  `Γ` is abelian**, which is the case in every use below, since `Γ = Im χ ≤ ℤ_pˣ`; that is
  `completedGroupAlgebra_mul_comm`, stated as an equation rather than as a second ring
  structure. The finite-level projections `completedGroupAlgebra.proj` land in the group algebra
  of `Γ/U` and are surjective, and `Λ` is separated, which together are the inverse-limit
  description. The group elements sit inside `Λ` through
  `completedGroupAlgebra.of : Γ →* Λˣ`, which is continuous. Functoriality is
  `completedGroupAlgebra.map` with `map_id`, `map_comp`, `map_of` and `map_surjective`.
  *Needs:* L0 inverse limits; M `MonoidAlgebra`, M `PadicInt`.

  API checklist for `completedGroupAlgebra`:
  - Constructors: the limit definition; `of` on a group element; the structure map from `ℤ_p`.
  - Examples: `Γ = ℤ_p`, where the algebra is `ℤ_p[[T]]`; `Γ` finite, where it is the finite
    group algebra, which `proj` at `U = 1` records.
  - Morphisms: continuous `ℤ_p`-algebra homomorphisms; evaluation at an element of the
    maximal ideal.
  - Functoriality: `map` for a continuous homomorphism, surjective for a surjection.
  - Comparison lemmas: the power-series coordinate below; `proj_of` at each finite level.
  - Naturality: the power-series coordinate depends on the chosen topological generator, and
    the dependence is the substitution recorded below.
  - Edge cases: the trivial group; a finite procyclic `Γ`, where the truncated statement
    holds and which the classification does not use; a non-abelian `Γ`, where the algebra is
    not commutative and the coordinate does not apply.
  - Downstream interfaces: the module statements of Labute Thms 5 and 6, used in Layer 9.
- **Compact modules.** `IsCompactModule p Γ M` is the predicate on a topological
  `Λ`-module saying that it is a topological additive group with continuous scalar action,
  compact and totally disconnected; for a module over a compact ring that is the same as being
  separated and complete, and it is what the inverse-limit description needs. The milestones
  are separatedness (`IsCompactModule.eq_zero_of_mem_open`), surjectivity of the transition maps
  between quotients by open submodules, stability of the predicate under quotients by closed
  submodules, and the exactness statement `compactModule_limit_surjective`: along a tower with
  surjective transition maps and levelwise surjective comparison maps between compact levels, a
  compatible family downstairs lifts. Without surjectivity of the transition maps that last
  statement is false, so it is a hypothesis and not decoration.
  *Needs:* L9 the algebra; L0 inverse limits.
- **Power-series coordinates.** For a chosen topological generator `γ` of `Γ ≅ ℤ_p`, the
  assignment `T ↦ γ - 1` extends to an isomorphism of `ℤ_p`-algebras
  `ℤ_p[[T]] ≅ completedGroupAlgebra p Γ`, named
  `completedGroupAlgebra.powerSeriesCoordinate`, with its defining value
  `powerSeriesCoordinate_X`. The dependence on `γ` is part of the statement: a different
  generator changes the isomorphism by the substitution `T ↦ (1+T)^u - 1` with `u ∈ ℤ_pˣ`, and
  every statement below is invariant under it.
  `PowerSeries` carries no topology at the pin, so the topological half of the coordinate is
  stated as `powerSeriesCoordinate_filtration`, the identification of the `X`-adic filtration
  with the kernels of the finite-level projections, which is exactly what the inverse-limit
  topology is.
  *Needs:* L9 the algebra; M `PowerSeries`.
  *Source:* Labute §1.5.
- **Evaluation.** For `ψ ∈ ℤ_p[[T]]` and `c` with `v_p(c) ≥ 1`, the evaluation `ψ(c) ∈ ℤ_p`
  converges, and `ψ ↦ ψ(c)` is a `ℤ_p`-algebra homomorphism (`powerSeriesEval`, with
  `powerSeriesEval_add_mul` and the defining values `powerSeriesEval_X_C`). The convergence
  hypothesis `v_p(c) ≥ 1` is carried in every statement.
  *Needs:* M `PowerSeries`, M `PadicInt` completeness.
- **Division.** For `ψ ∈ ℤ_p[[T]]` and `c` with `v_p(c) ≥ 1`, `(T - c) ∣ ψ` in `ℤ_p[[T]]` if
  and only if `ψ(c) = 0`, in both directions, with the quotient given by the explicit
  series (`powerSeries_sub_C_dvd_iff`). This is the special case of Weierstrass division that
  Labute uses on p. 122; the general Weierstrass preparation theorem is not a target. It is the
  step that produces the basis correction of Layer 9.
  *Needs:* L9 evaluation.
  *Source:* Labute §4, p. 122.
- **The dyadic branch `Γ ≅ C₂ × ℤ₂`.** The same package for the second shape, by either of
  two routes, and the roadmap takes the first:
  1. *Direct.* `completedGroupAlgebra 2 Γ ≅ ℤ₂[C₂][[T]]`
     (`completedGroupAlgebra.dyadicCoordinate`), with `T = γ - 1` for a topological generator
     `γ` of the `ℤ₂`-factor. The coefficient ring is the group ring of `C₂` over `ℤ₂`, and `C₂`
     is `Multiplicative (ZMod 2)`, a genuine cyclic group. ⚠ It is **not** `ZMod 2` read as a
     multiplicative monoid, whose monoid algebra is a different ring.
  2. *By descent.* Restrict to the open procyclic subgroup `U^(f) ≤ Γ` of index 2, apply the
     procyclic package there, and descend along the `C₂`-action.

  After inverting `2` the group ring splits into the two eigenspaces of the involution, through
  the idempotents `(1 ± σ)/2`, and each eigenspace of the power-series ring over it is again a
  power-series ring; that is `monoidAlgebraRatPadicCyclicTwoEquiv`. ⚠ **There is no integral
  splitting.** The idempotents use `1/2`, so `ℤ₂[C₂]` does not decompose: its only idempotents
  are `0` and `1`, which is `monoidAlgebraPadicIntCyclicTwo_isIdempotentElem`. Claiming a direct
  product decomposition over `ℤ₂` is the error that statement rules out, and the Layer 9 basis
  corrections are read in the `ℚ₂`-eigenspaces and then cleared of denominators.
  *Needs:* L9 the procyclic package; L7 the closed subgroups of `ℤ₂ˣ`; L1 index.
  *Source:* Labute §4, p. 122, where the two even-rank families are treated separately.

#### Labute's relation module

The module Labute's Thms 5 and 6 work with is **not** the abelianized relation module. His §4
Definition, on p. 121, sets `X = ker(χ)`, `E = X/(X, X)`, `Γ = F/X` and `Λ = Z₂(Γ)`, and makes
`E` a topological `Γ`-module by `α·ξ = ` the class of `y⁻¹xy` for `ξ = x̄` and `α = ȳ`. The
seven points that fix the object are these.

1. **The object.** `E = X/(X, X)`, the topological abelianization of `X = ker χ`. In
   `Suggested.lean` it is `labuteE`, written additively.
2. **Its construction from `1 → R → F → G → 1`.** `χ` is the canonical character of `G`
   composed with `F ↠ G`, regarded as a character **on the free group** `F`; `X = ker(χ : F → Γ)`
   contains `R`; and `Γ = F/X ≅ Im χ`.
3. **What it is not.** It is neither `R/[R, R]` nor `R/[F, R]`. Those are quotients of the
   relation subgroup, while `E` is built from the whole of `ker χ`. The relator enters through
   its image `r̄ ∈ E`, which makes sense because `r ∈ R ⊆ X`.
4. **The map from the full relation module.** The inclusion `R ⊆ X` induces
   `R^{ab} → E` (`relationModuleToLabuteE`), and the proofs use only the image of the relator
   under it. That is why `R^{ab}` carries no milestone of its own here.
5. **The acting algebra.** `Λ = completedGroupAlgebra p Γ` with `Γ = Im χ`. For `Γ ≅ ℤ₂` it is
   `ℤ₂[[T]]` with the generator going to `1 + T`, and for `Γ ≅ C₂ × ℤ₂` it is
   `ℤ₂[C₂] ⊗ ℤ₂[[T]]` (Labute p. 122). Those are the two shapes of the previous subsection.
6. **The theorem connecting the action to `χ`.** The conjugation action of `F` on `E` factors
   through `Γ = F/ker(χ) ≅ Im χ`, because inner automorphisms by elements of `X` act trivially
   on `X/(X, X)`. That is the whole of the connection.
   ⚠ **The action is conjugation by `Γ`, and not multiplication by the scalar `χ(g)`.** The
   scalar reading is false: `ℤ_p² = ⟨x, y ∣ (x, y)⟩` is Demushkin with trivial orientation,
   while its relation module carries the regular action through the conjugates of the relator,
   which a trivial scalar action would collapse to coinvariants.
7. **The hypotheses.** `r` is a Demushkin relator with the §4 normalizations: `q = 2` and `n`
   even. Labute's Thm 5 is the branch `Im χ = U₂[f]` with `f ≠ ∞`, and his Thm 6 the branch
   `Im χ = {±1} × U₂(f)` with `2 ≤ f < ∞`.

The milestones are: `labuteE` with its abelianness `labuteE_add_comm`; the conjugation action
`labuteAction` with its laws and its defining equation `labuteAction_apply`; the scalar action
`labuteSMul` of `Λ`, with the module axioms `labuteSMul_laws`, its continuity, and
`labuteSMul_of` saying that it extends the conjugation action; the comparison map
`relationModuleToLabuteE`; and the relator class `labuteRelatorClass`.
⚠ The module axioms are stated as equations about a named scalar-action map rather than through
a `Module` instance, because `E` is a quotient group and installing a second additive structure
on it would not be definitionally the first.
*Needs:* L5 presentations; L7 canonical character; L9 the algebra and its compact modules; L4
abelian pro-`p` structure theory.
*Source:* Labute §4 Definition, p. 121.

#### The two module criteria that the classification uses

With `E` and `Λ` as above, a chosen topological generator `γ` of `Γ` and `T = γ - 1`:

- **The expression of the relator image.** `E` is topologically generated over `Λ` by finitely
  many classes `ȳ_i` of the basis elements lying in `X` (`labuteE_exists_generators`), and `r̄`
  is a `Λ`-combination of them (`labuteRelatorClass_eq_sum`), with the coefficients read off the
  normal form of `r`. Labute computes on p. 122
  `r̄ = (1 + a + (1+T)^a) ȳ₁ + (2^g + (1+T)^{ab} − 1) ȳ₃`
  in the dyadic even-rank branch.
- **The basis correction.** Applying the division criterion `(T − c) ∣ ψ ⟺ ψ(c) = 0` to those
  coefficients replaces the generators by ones in which the relator image is a single multiple:
  for the parameters `(α, f)` there is `z₁` with `r̄ = (2 + 2^f + T) z̄₁`
  (`labuteRelatorClass_eq_smul_of_dyadic`). The corrections then iterate along the descending
  `2`-central series, which is where Layer 8's comparison schema takes over. This is the exact
  point at which the Division milestone above is used.
- **The annihilator.** The annihilator of `E` as a `Λ`-module is generated by one element, the
  *relator series* `ψ_r`, read off the normal form of `r`
  (`labuteE_annihilator_isPrincipal`); two relators with the same invariants have associated
  series, that is they differ by a unit of `Λ`.
  ⚠ The annihilator statement is about `E`, and **not** about `R^{ab}`: no claim is made here
  about the annihilator of the full relation module.
- **Membership.** For `λ ∈ Λ` corresponding to `T − c` under the coordinate, membership of `r̄`
  in `λE` is the vanishing `ψ_r(c) = 0` (`labuteRelatorClass_mem_smul_iff`). The basis
  correction exists exactly when the membership holds.

Both criteria carry the hypotheses that `E` is a compact `Λ`-module, that it is separated and
complete, and that the transition maps of its defining system are surjective.
`Suggested.lean` has the signatures.
*Needs:* L9 Labute's relation module, L9 power-series coordinates, L9 evaluation, L9 division.
*Source:* Labute Thms 5 and 6, and the computation on p. 122.

### Layer 9: the classification of Demushkin groups

The full Demushkin–Serre–Labute classification, after the Layer 8 method, because its proofs
are successive-approximation arguments along the lower `p`-series, and after the two
prerequisites. Source of record: Labute, *Classification of Demushkin groups*, Canad. J.
Math. 19 (1967), 106–132; modern statements in NSW III §9. The notation is the one fixed in
Layer 8.

- **Cup-form normal forms.** The image of the relator in `gr_1(F)` computes the cup product:
  `r̄` paired with `χ_i ∪ χ_j` is `a_{ij}` off the diagonal and `(q choose 2) a_i` on it.
  Feeding the matrix through the change-of-basis theorem gives
  `r ≡ x₁^q(x₁,x₂)(x₃,x₄)⋯(x_{n-1},x_n)` modulo `λ_2(F)` when the form is alternating, with
  `n` even; and `r ≡ x₁²(x₂,x₃)(x₄,x₅)⋯` modulo `λ_2(F)` in the nonalternating case, which
  is exactly `p = 2` with `q = 2`, and where `n` may be odd.
  *Needs:* L9 prerequisites; L8 notation; L7 the predicate.
  *Source:* Labute Prop. 3, Prop. 4 and their corollary.
- **The successive-approximation argument.** The span statements, in the Layer 8 notation:
  for `q ≠ 2`, `gr_j(F) = Im δ_j` for every `j ≥ 2`; for `q = 2`, `gr_j(F) = Im δ_j + T_j`,
  where the tails are what the dyadic failure of additivity of `π` leaves. Each is an
  identity of subspaces of a finite-dimensional space. The limit process is the Layer 8
  comparison schema, with `S k` the finite nonempty set of level-`k` basis corrections that
  carry the given relator into normal form. The conclusion: a Demushkin group with
  `q(G) = q` has a basis in which
  - `r = x₁^q(x₁,x₂)(x₃,x₄)⋯(x_{n-1},x_n)`, if `q ≠ 2`;
  - `r = x₁²x₂^{2^f}(x₂,x₃)(x₄,x₅)⋯` with `2 ≤ f ≤ ∞`, if `q = 2` and `n` is odd;
  - `r = x₁^{2+α}(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯` with `2 ≤ f ≤ ∞` and `α ∈ 4ℤ₂`, if `q = 2` and `n`
    is even.

  Implement this through the schema, and do not re-derive a limit argument.
  *Needs:* L8 comparison schema, L8 `δ_j` and `T_j`; L9 cup-form normal forms.
  *Source:* Labute Prop. 5 and Thm 3.
- **Character values in normal form.** Existence of `χ` by explicit values on the
  normal-form basis:
  - case `q ≠ 2`: `χ(x₂) = (1-q)^{-1}`, and `1` on the other generators;
  - case `q = 2` with `n` odd: `χ(x₁) = -1`, `χ(x₃) = (1-2^f)^{-1}`, and `1` otherwise;
  - case `q = 2` with `n` even: `χ(x₂) = -(1+α)^{-1}`, `χ(x₄) = (1-2^f)^{-1}`, and `1`
    otherwise.

  Uniqueness follows from the forced computation on a derivation. The image table is
  `1 + qℤ_p`; `{±1} × U^(f)`; and, for `n` even, `{±1} × U^(f)` if `v₂(α) ≥ f`, and
  `U^[f']` with `f' = v₂(α)` if `f' < f`.
  *Needs:* L7 canonical character; L9 normal forms; L7 the subgroups of `ℤ₂ˣ`.
  *Source:* Labute Thm 4 and its corollary.
- **The marked classification.** For each normal-form family, the classification is stated in
  marked form: a continuous isomorphism from the Demushkin group onto
  `presentedProP p (Fin n) {r}` for the normal-form relator `r`, under which the canonical
  character takes the values of the table above on the marked generators. The three statements
  are `isDemushkin_marked_of_q_ne_two`, `isDemushkin_marked_of_q_two_odd` and
  `isDemushkin_marked_of_q_two_even`, and the relator words are the named terms
  `demushkinWordNeTwo`, `demushkinWordTwoOdd` and `demushkinWordTwoEven`, each written on a
  tuple of group elements so that the same word can be read in `F` and in `G`. The character
  values are stated as equations in `ℤ_p`, for instance `χ(x₂)(1 - q) = 1` in place of
  `χ(x₂) = (1-q)^{-1}`, so that no unit has to be constructed in order to state them. The
  unmarked isomorphism statements are corollaries, obtained by forgetting the character
  clause. The marked form supplies the normalization consumed by `LocalGaloisGroups`.
  *Needs:* L9 normal forms and character values; L9 Labute Thm 2 in marked form; L5
  presentations.
  *Source:* Labute Thms 1, 2 and 4.
- **The `q = 2` even-rank case.** The arguments over `Λ = ℤ₂[[Γ]]` with `Γ = Im χ`, acting on
  Labute's module `E = ker(χ)/(ker χ, ker χ)` and not on `R^{ab}`, using the completed-algebra
  prerequisite, that is the power-series coordinate, evaluation, and the division criterion. Two even-rank families, with `N = n/2` and `(A : A²)` as declared in
  Layer 8:
  - `r = x₁^{2+2^f}(x₁,x₂)(x₃,x₄)⋯` realizes `Im χ = U^[f]`, where `(A : A²) = 2`, for
    `N ≥ 1` and `2 ≤ f < ∞`. ⚠ The endpoint `f = ∞` is a separate statement, because
    `U^[f] = closure ⟨-1 + 2^f⟩` is defined only for finite `f`. At `f = ∞` the relator is
    `x₁²(x₁,x₂)(x₃,x₄)⋯` and the image is `{±1} = V^(∞)`;
  - `r = x₁²(x₁,x₂)x₃^{2^f}(x₃,x₄)⋯` realizes `Im χ = {±1} × U^(f)`, where `(A : A²) = 4`,
    for `N ≥ 2` and `2 ≤ f < ∞`, and `f = ∞` is excluded.

  Each statement carries the restrictions on `N` and `f` as hypotheses.
  *Needs:* L9 completed group algebra; L9 character values; L8 comparison schema.
  *Source:* Labute Thm 1, through Thms 5 and 6.
  ⚠ Cite Labute, and not NSW, for completeness. NSW (3.9.19) states only the existence of
  the `q = 2` normal forms; which pairs `(α, f)` give isomorphic groups is Labute Thms 1, 2,
  4, 5 and 6.
  ⚠ NSW print the second even form as `x₂²(x₁,x₂)x₃^{2^f}⋯` on page 417 of the second
  edition, where Labute has `x₁²(x₁,x₂)x₃^{2^f}⋯`. The two are equivalent under a basis
  change; quote the exact form of each source.
- **The classification theorems.**
  - *Uniqueness:* two Demushkin groups with the same `n` and the same `Im χ` are isomorphic.
  - *Uniqueness, marked form (Labute Thm 2).* An automorphism of `F` carries any Demushkin
    relator to any other with the same invariants; in `Suggested.lean` this is
    `exists_continuousMulEquiv_map_demushkinRelator`, stated as the equality of the two closed
    normal closures. This is a milestone in its own right, and not a remark, because it is what
    turns "isomorphic" into "isomorphic by a basis change" and so makes the marked normal forms
    below a normalization rather than a choice.
  - *Existence:* let `A` be a closed subgroup of `ℤ_pˣ` that is **pro-`p`**. Then `(n, A)`
    is realized in exactly three situations:
    1. `n` is even and `p^n > (A : A^p)`;
    2. `n` is odd and `n ≥ 3`, so `p = 2`, and `A = {±1} × U^(f)` with `f ≥ 2` or `f = ∞`;
    3. `n = 1` and `A = {±1}`.

    ⚠ The hypothesis that `A` is pro-`p` is part of the statement, because `A` is the image
    of a pro-`p` group under a continuous homomorphism. Without it the numerical condition
    admits impossible pairs: at `p = 3` and `n = 2`, the subgroup `A = ℤ₃ˣ` has
    `(A : A³) = 3 < 9`, and it contains `{±1}`, so it is not pro-`3`. For odd `p` the
    condition is `A ≤ 1 + pℤ_p`. For `p = 2` every closed subgroup of `ℤ₂ˣ` is pro-`2`, so
    the three families of Layer 7 are all admissible.

  The small-rank cases are part of the statement. For the odd case cite Serre's Thm 3.2 only
  for `n ≥ 3`, because its printed `n ≥ 1` degenerates at `n = 1`; handle `n = 1` through
  NSW (3.9.10) and Labute Remark 2(iii).
  *Needs:* L9 normal forms and character values; L8 comparison schema; L3 Hopf property.
  *Source:* Labute Thms 1 and 2, and Remark 2.
- **Consequences.** The open-subgroup theorem was proved in Layer 7 from the duality
  package. Here it acquires its classification content: for `U` open in an infinite
  Demushkin `G`, the invariants of `U` are `n(U) = 2 + [G : U](n(G) - 2)` and
  `Im(χ|_U) = χ(U)`, so the classification identifies `U` up to isomorphism.
  *Needs:* L7 open-subgroup theorem; L9 classification.
  *Source:* Serre, *Structure de certains pro-p-groupes*, Thm 9.2.
  ⚠ At `n = 2` the rank formula gives `n(U) = 2` for every `U`, so the rank-2 groups with
  `q ≠ 2`, which are `ℤ_p ⋊ ℤ_p`, are the case to check first.

### Layer 10: free pro-`C` groups on profinite spaces

This layer is the home of the infinite-rank theory.

- **Construction and universal property.** `F_C(X, ∗)` on a pointed profinite space, with a
  basis that converges to `1`: continuous maps `X → P` that send `∗` to `1` correspond to
  continuous homomorphisms into a profinite `P` in the class `C`. It recovers the Layer 4
  object for finite discrete `X`. For an infinite discrete set `S` there are two candidate
  objects:
  - `freeProC C S`, the Layer 4 construction, whose universal property quantifies over all
    maps `S → P`;
  - `F_C(S⁺, ∗)` on the one-point compactification, whose universal property quantifies
    over maps that converge to `1`.

  The inclusion `S → S⁺` induces a continuous surjection `freeProC C S ↠ F_C(S⁺, ∗)`. The
  theorem to prove is that **at `C = finiteGroupClassP p`** this map is not injective for
  infinite `S`. The witness is a computation of ranks, and not a description of the kernel by
  generators, which this roadmap does not claim: the continuous characters of the source are
  all maps `S → 𝔽_p`, a product of dimension `p^{#S}` by the Erdős–Kaplansky theorem, while
  those of the target are the finitely supported maps, of dimension `#S`.
  ⚠ The statement is false for an arbitrary class. If `C` contains only the trivial group,
  both objects are trivial and the map is injective. Do not state it for `FiniteGroupClass`
  when the proof is specific to pro-`p`.
  Never write "the free pro-`C` group on `S`" without saying which object is meant.
  *Needs:* L4 free objects and `FiniteGroupClass`; L3 rank.
  *Source:* Ribes–Zalesskii §3.3.
- **Bases and rank.** Three statements:
  - existence of bases that converge to `1`, and uniqueness of their cardinality;
  - invariance of `topologicalGeneratorRank` under topological isomorphism, as a cardinal
    and with no finiteness hypothesis;
  - the infinite-rank Frattini argument in the form proved in Layer 3, that is
    `topologicalGeneratorRank G = dim_{𝔽_p} Hom_cont(G, 𝔽_p)`.

  The
  rank of `F_C(X, ∗)` at `C = ` finite `p`-groups is the `𝔽_p`-dimension of the space of
  continuous functions `X → 𝔽_p` that vanish at `∗`, which for `X = S⁺` is `#S`.
  *Needs:* L3 rank and Burnside; L10 construction.
- **Presentations at arbitrary rank.** Every pro-`p` group has a presentation by a free
  pro-`p` group on a profinite space, and has a minimal one. This is the general statement
  that Layer 5 does not make.
  *Needs:* L10 construction; L3 Burnside.
- **Serre's theorem in full generality.** `cd_p G ≤ 1` if and only if `G` is free pro-`p`,
  with no finite generation, which is the Layer 6 proof upgraded with bases that converge to
  `1`. Closed subgroups of free pro-`p` groups are free pro-`p`, which is the full pro-`p`
  Nielsen–Schreier theorem.
  *Needs:* L6 Serre's theorem; L10 bases and presentations.
  *Source:* Ribes–Zalesskii Cor. 7.7.5.
- Nothing later in this roadmap uses this layer, because Layers 9 and 11 need only finite
  rank. Without it the theory is truncated.

## Worked examples

Acceptance examples include free pro-`p` groups at finite rank, finite cyclic and elementary
abelian pro-`p` groups, standard one-relator Demushkin presentations, and the abstract dyadic
group `D₀ = ⟨A,S,Y ∣ A²S⁴(S,Y)⟩`. These test the abstract classification and comparison APIs;
identifying `D₀` with a local Galois group is deliberately downstream.

## Dependency order

Layers 0–3 establish the profinite and generator-rank substrate; Layers 4–6 construct free
objects and cohomological freeness; Layers 7–8 control one-relator quotients and finite
approximations; Layers 9–10 complete the Demushkin classification and arbitrary-rank theory.

## Material extracted from the former pro-`p` portfolio

The arithmetic of `G_K(p)`—finite generation, the `[K : ℚ_p] + 2` dichotomy, roots of unity,
the canonical orientation, and the local Demushkin presentation—now belongs to
`LocalGaloisGroups`. No theorem in this roadmap depends on a local field, and the
`LocalGaloisGroups` and `LocalFieldsRamification` dependencies are one-way: they import this
roadmap, while this roadmap imports neither arithmetic supplier.

## References

The mathematical spine is Serre, *Galois Cohomology*; Ribes–Zalesskii, *Profinite Groups*;
Neukirch–Schmidt–Wingberg, *Cohomology of Number Fields*; and the classification work of
Demushkin, Labute, and Serre. Implementation and source details are maintained in a private
provenance ledger.
