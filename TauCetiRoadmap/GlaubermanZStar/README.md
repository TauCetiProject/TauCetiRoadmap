# Roadmap: isolated involutions and Glauberman's Z* theorem

Prove Glauberman's Z* theorem for involutions of finite groups. If an involution
`t` has no distinct conjugate commuting with it, then its image in
`G/O_{2'}(G)` is central. Equivalently, if `t` is the only conjugate of itself
in a Sylow `2`-subgroup containing it, then `t ∈ Z*(G)`, the inverse image of
`Z(G/O_{2'}(G))`. Develop the fusion, principal-block and transfer arguments
as reusable theory, including a prior proof of the Brauer–Suzuki theorem.

Suggested home: `TauCeti/GroupTheory/Local/ZStar/`, with reusable character
lemmas in the native character-table library and ModularCharactersAndBlocks'
suggested block-theory directories.
The scope is the classical involution theorem at the prime two. Assertions
about isolated elements at arbitrary odd primes are outside this roadmap.

## Foundations and ownership

- Mathlib supplies Sylow groups, conjugation, centralizers, quotient groups,
  normal closures, transfer, generalized quaternion groups and finite group
  actions. Use `IsConj`, `orderOf`, `Subgroup.center`, `Subgroup.centralizer`
  and the native transfer homomorphism.
- LocalFiniteGroupTheory [#1634](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1634),
  L1, owns the `2'`-core and its normality, quotient and characteristic APIs;
  L4 owns the cyclic/generalized-quaternion characterization of `2`-groups
  of rank one; L5 owns normal-complement and transfer applications. Use
  `pPrimeCore 2 ⊤` for `O_{2'}(G)`, with a notation adapter if useful. Its
  odd order follows from prime-set core theory, not from Feit–Thompson.
- [ModularCharactersAndBlocks](../RepresentationTheory/ModularCharactersAndBlocks/README.md),
  M0–M8, owns the splitting modular system, ordinary/modular block comparison,
  Brauer maps, section orthogonality, third main theorem, and principal-block
  kernel theorem. Z3–Z4 consume these actual exports at `p = 2`.
- [CharacterTheory](../RepresentationTheory/CharacterTheory/README.md) owns
  ordinary character values, kernels, Frobenius–Schur theory, orthogonality
  and §4.4's Galois action on irreducibles, including the coprime power-map
  identities.
  Reuse those objects and the comparison with the block theory; a private
  character basis indexed by an unrelated Wedderburn decomposition is not
  the public interface.
- [InductionRestriction](../RepresentationTheory/InductionRestriction/README.md),
  Layers 2 and 5, owns induction, Frobenius reciprocity, inertia groups,
  Clifford theory and inflation. Z2 consumes these native interfaces.
- [OddOrderTheorem F2](../OddOrderTheorem/README.md#f2-dade-isometries-and-coherent-families)
  owns the general Dade isometry and its comparison with ordinary induction
  when every centralizer complement is trivial. Z2 consumes this comparison
  for native `TauCeti.IsTISet` data, with no cyclic-factor or coherence
  premise. The general theorem must not assume `IsTISubgroup` of the
  normalizer: that additional hypothesis of the existing
  `characterPairing_ind_ind_of_isTISet` does not hold in Z2. These
  general modules are independent of the local minimal-odd-simple analysis
  and of the final odd order theorem.

This roadmap owns Brauer–Suzuki's generalized-quaternion Sylow theorem, the
additional principal-block character-value lemmas below, and the full Z*
argument. It has no dependency on the Feit–Thompson endpoint or on CFSG.
It consumes the general F2 library, not OddOrderTheorem's F3–F6. None of its
dependencies may use Z* to prove an input needed here, and F2's generic
modules must not import the final odd-order assembly.

## Conventions and public statements

Work with arbitrary finite groups, `[Group G] [Finite G]`, and `Nat.card G`.
An involution is expressed by `orderOf t = 2`, or by `t ≠ 1` and `t*t = 1`
with a proved equivalence. **Isolation** means

```lean
∀ g : G, (g * t * g⁻¹) * t = t * (g * t * g⁻¹) → g * t * g⁻¹ = t
```

**Weak closure of the singleton in a Sylow subgroup** means
`∀ g, g⁻¹*t*g ∈ S → g⁻¹*t*g = t`, where `t ∈ S`.
Prove the equivalence of these conditions in Z0; neither condition merely
asserts `t ∈ Z(S)`.

Define `Z*(G)` as the preimage of the actual center under
`G → G/O_{2'}(G)`. The principal endpoint is membership of the isolated
involution in this subgroup. Export also the self-contained existence form

```lean
∃ N : Subgroup G, N.Normal ∧ Odd (Nat.card N) ∧
  ∀ g : G, g * t * g⁻¹ * t⁻¹ ∈ N
```

and prove equivalence with centrality modulo the `2'`-core. All concluding
normal subgroups must be actual subgroups of `G`; their odd order and the
commutator containments are conclusions, not hypotheses.

## Milestone graph

| Layer | Inputs | Deliverable |
| --- | --- | --- |
| Z0 | Sylow and conjugation theory | isolation, weak closure and their transport |
| Z1 | Z0, local cores and transfer | order induction and group-theoretic reductions |
| Z2 | L4–L5, ordinary induction/Clifford theory, OddOrderTheorem's generic F2 | Brauer–Suzuki, independent of Z* and the odd-order endpoint |
| Z3 | block theory M5–M8, L1 core maximality | principal-block stability on involution sections |
| Z4 | Z0–Z1, Z3, M5 block orthogonality, ordinary central characters | character-value alternative and orthogonality contradiction |
| Z5 | Z0–Z4 | Z*, its Sylow form and applications |

### Z0: isolated involutions and fusion

For an involution `t ∈ S`, with `S` a Sylow `2`-subgroup, prove equivalence
between global isolation, singleton weak closure in `S`, and
`t^G ∩ C_G(t) = {t}`. In particular isolation implies `t ∈ Z(S)`.
Develop invariance under conjugation and group equivalences, and restriction
to a subgroup containing `t`. Prove descent of isolation through any normal
subgroup `N` not containing `t`: its image is still an isolated involution in
`G/N`. Prove the Sylow/coset conjugacy argument establishing this, and the
odd-kernel lifting statements with their precise conjugacy hypotheses.

Prove the product-conjugacy lemma: if `t` is isolated and `a,b ∈ C_G(t)`
are conjugate in `G`, then `ta` and `tb` are conjugate in `G`. Use Sylow
conjugacy in `C_G(b)` to arrange that a conjugate of `t` commutes with
`t`, then apply isolation.

Develop the dihedral subgroup generated by two involutions `a,b`. If `ab`
has odd order, prove `a` and `b` are conjugate in that subgroup. If `ab`
has order `2k`, prove `(ab)^k` is an involution centralizing both. Supply
the corresponding power, core and quotient formulas; Z4 uses these same
lemmas. For `orderOf(ab)=2k` with `k` even, prove
`(ab)^(-k/2) a (ab)^(k/2)=a(ab)^k` using integer powers. Thus `a`
has a distinct conjugate commuting with it. Apply this inside a Sylow
`2`-subgroup to complete isolation ⇒ weak closure (handle `k=1` directly).

### Z1: order induction and normal-closure reduction

Establish well-founded induction on the order of the ambient group, including
strict inequalities for proper subgroups and nontrivial normal quotients.
Prove the extension and quotient lemmas for the existence-form conclusion.
Reduce to the case in which the normal closure of `t` is the whole group and
the relevant `2'`-core has been removed. Every call to the induction hypothesis
must identify the smaller group and its isolated involution.

If the normal closure of `t` is `G`, prove the normal-generation alternative
`G' = G` or `|G:G'| = 2`. Prove the passage from a conclusion for the normal closure to
a conclusion for `G`, and handle the index-two case with a unique Sylow
involution directly, leaving the perfect unique-involution case to Z2.
Include the case of a central involution and quotients by
nontrivial normal `2`-subgroups, proving the isolation premise of every
quotient call. For a normal `2`-subgroup `N`, first use `N≤S` and
`t∈Z(S)` to get `t∈C_G(N)`. If that centralizer is proper, prove
`t^G=t^{C_G(N)}` by Sylow conjugacy and apply induction there. If `N` is
central, the preimage `M` of `O_{2'}(G/N)` splits as `N×O_{2'}(M)`;
use this decomposition and descent of isolation in `G/O_{2'}(M)` for the
lifting argument. Z4 only needs the central order-two case.
These reductions are established before Z2; Z5 invokes Z2
in their remaining perfect case. No principal-block stability premise may
remain at the final endpoint.

### Z2: the Brauer–Suzuki case

Prove that a finite group whose Sylow `2`-subgroup is generalized quaternion
has the image of its unique Sylow involution central modulo `O_{2'}(G)`.
Use actual native quaternion groups, with order and parameter conventions
made explicit. Follow Suzuki, *Group Theory II*, Chapter VI, §2.2,
Example 3, with the following ordinary-character targets:

1. Prove the unique involution, center, cyclic subgroup and order-four
   structure of generalized quaternion groups, and the fusion constraints
   on their order-four elements, including conjugacy up to inversion.
2. Reduce by the `2'`-core and induction to the core-free configuration.
   Choose a cyclic index-two subgroup `X` of the quaternion Sylow `S`
   and its subgroup `U` of order four; prove `U ⊴ S`. For `Q₈` any
   cyclic order-four choice works. Put
   `C = C_G(U)` and `H = N_G(U)`, and prove
   `K = {k ∈ C | 4 ∣ orderOf k}` satisfies native `TauCeti.IsTISet K H`
   and `N_G(K)=H`. Prove `S≤H`, `C⊴H`, and `C_S(U)=X` is Sylow in
   `C`, so the Sylow subgroup of `C` is cyclic. Use uniqueness of its
   order-four subgroup to prove the T.I. claim. The T.I. assertion is
   about `K`; conjugates of `U` itself can share the involution.
3. Apply F2's general Dade/induction comparison with every `H_a = 1`
   to class functions supported on `K`. Prove `C_G(k) ≤ H` and fusion
   control on `K`, so these Dade hypotheses hold. Construct the cyclic
   quotient models and use CharacterTheory's Galois action where required.
   No coherence theorem or decomposition into two cyclic factors is used.
   Prove the norm and inner-product calculations,
   the required low-norm signed irreducible decompositions, and all fusion
   and degree constraints used in those calculations.
4. Prove the final degree arithmetic modulo four and eight, rule out the
   reduced counterexample, and lift centrality through the odd core.

The three-page Brauer–Suzuki announcement identifies the result; Suzuki's
example specifies this proof route. No modular block theorem or final
odd-order theorem is an input to Z2.

Handle cyclic Sylow `2`-subgroups through normal-complement theory. With the
rank-one `2`-group classification from the local-theory roadmap, deduce the
case in which a Sylow `2`-subgroup contains only one involution. In particular,
prove a group with generalized-quaternion Sylow `2`-subgroups cannot be
nonabelian simple. No assumption of simplicity is imposed on the main
Brauer–Suzuki theorem.

### Z3: principal-block stability

Compare the prototype `InPrincipalTwoBlock m χ` with M4's principal block
for every maximal ideal `m` of `integralClosure ℤ ℂ` containing two.
Intersect with the integral cyclotomic field, construct the compatible
completion and root lifts there, and use M1–M2's change-of-system comparisons
to prove `InPrincipalTwoBlock m χ ↔ χ∈B₀(G)` for the fixed system. This
includes invariance of the principal block under change of prime above two;
it is an explicit comparison target before applying the prototype theorems.

For every ordinary irreducible `χ` in the principal `2`-block, every involution
`s`, and every odd-order normal subgroup `N` of `C_G(s)`, prove
`χ(s*n) = χ(s)` for `n ∈ N`. This is constancy on that part of the involution
section, not a claim that the restriction of `χ` has `N` in its full kernel.
Prove it in the following order, consuming M5's native complex-character
comparison maps and M1's root lifting:

1. The second main theorem restricts the nonzero generalized decomposition
   coefficients of `χ` at `s` to Brauer blocks of `C_G(s)` corresponding
   to `B₀(G)`.
2. Apply M7's local third main theorem with `P = ⟨s⟩` and `H = C_G(s)`;
   the only such local block is `B₀(H)`.
3. By M8's Brauer-character kernel containment, every simple Brauer character
   of `B₀(H)` is trivial on the odd normal subgroup `N`.
4. The `2`-part of `sn` is `s`, and its odd part is `n`. M5's decomposition
   formula therefore evaluates every selected local Brauer character at its
   degree, giving `χ(sn) = χ(s)`.

The constancy theorem does not assume isolation or Z*; those hypotheses
enter the next layer. Root lifting and the ordinary/modular comparison maps
remain owned by the block roadmap.

### Z4: character values and the contradiction

In the order-induction reduction of Z1, suppose a Sylow subgroup contains a
second involution `s ≠ t`. By Z0 it commutes with `t`, and isolation implies
it is not conjugate to `t`. For every nontrivial ordinary irreducible `χ` in
the principal `2`-block, prove, using Z3 and the smaller-group induction,
that either the Z* conclusion already follows or

`χ(s) = 0` or `χ(t) = -χ(1)`.

Construct the alternative through these explicit steps:

1. For conjugates `t'` of `t` and `s'` of `s`, conjugate simultaneously to
   `t,h` with `h` conjugate to `s`. The dihedral lemma of Z0 shows `th`
   has even order, since `t` and `h` are not conjugate.
2. Its central involution `w = (th)^(orderOf(th)/2)` centralizes both `t`
   and `h`. If `C_G(w)` is proper, apply order induction in that centralizer.
   If `w` is central in `G`, apply Z1's normal-`2`-subgroup quotient reduction
   instead. Prove the dichotomy gives either the Z* conclusion or an odd
   normal subgroup of `C_G(w)` containing the needed commutators.
3. Prove the full dihedral odd-core package: `(th)² ∈ N`,
   `k = orderOf(th)/2` is odd, `v = w(th) ∈ N`, and `μ = tw` is an
   involution with `μh ∈ N` of odd order. Thus `μ` is conjugate to `h`
   and hence to `s`, and `tμ=w`. Z3 gives `χ(th)=χ(w)`. Since `s,μ`
   centralize `t`, apply Z0's product-conjugacy lemma to obtain
   `ts ~ tμ=w` and therefore `χ(w)=χ(ts)`. This proves constancy of
   `χ(t's')` on the two conjugacy classes, with value `χ(ts)`.
4. Apply the class-sum coefficient formula to obtain
   `χ(ts)χ(1) = χ(t)χ(s)`. Repeat with the involution `ts`, which commutes
   with `t` and is not conjugate to it, obtaining
   `χ(s)χ(1) = χ(t)χ(ts)`.
5. Thus `χ(s)(χ(1)^2 - χ(t)^2) = 0`. The ordinary character-kernel theorem
   and the full-normal-closure hypothesis exclude `χ(t) = χ(1)` for a
   nontrivial irreducible. This gives the asserted zero-or-negative-degree
   alternative.

State the intermediate disjunctions with the induction and group hypotheses
above; the alternative is not asserted for arbitrary commuting involutions.

Apply block-section orthogonality to `(s,t)` and `(s,1)`. For involutions the
character values are real, so the two sums combine into
`∑χ∈B₀ χ(s)*(χ(t)+χ(1)) = 0`.
The alternative makes every nontrivial term zero and the trivial term is
two, a contradiction in characteristic zero. Verify that the native trivial
character belongs to the principal block, that it is counted once, and that
the second orthogonality sum is justified by distinct `2`-parts.

### Z5: assembly and applications

Combine the second-involution contradiction with Z2's unique-involution case
and discharge the induction of Z1. Prove membership in `Z*(G)` for every
isolated involution, the existence-form endpoint, and the Sylow weak-closure
form at arbitrary universes.

Export `G = C_G(t) O_{2'}(G)` as an elementwise factorization, and centrality
when `O_{2'}(G) = 1`. Prove that in a finite nonabelian simple group no
involution is weakly closed as a singleton in a Sylow `2`-subgroup. Give
quotient and conjugation transport using the actual center and core maps.

## Checks

Check the theorem on `C₂`, on a reflection in `S₃` (the normal odd subgroup
is `A₃`), and on the unique involution of `Q₈`. For the Klein four group,
each involution is isolated and the center is the whole group. Also exhibit
distinct commuting conjugate involutions in `A₅`, verifying that isolation
is a substantive hypothesis. Check that the public theorem requires only
finiteness, an involution and isolation, and that Z2 does not import Z5.

## References and provenance

- G. Glauberman, *Central elements in core-free groups*, Journal of Algebra
  4 (1966), 403–420.
- R. Brauer and M. Suzuki, *On finite groups of even order whose 2-Sylow group
  is a quaternion group*, Proceedings of the National Academy of Sciences
  45 (1959), 1757–1759.
- M. Suzuki, *Group Theory II*, Chapter VI, §2.2, Example 3, for the
  ordinary-character proof of the generalized-quaternion Sylow theorem.
- D. Gorenstein, *Finite Groups*, for transfer, quaternion Sylow groups and
  the local character arguments.
- The [Lean evaluation statement](https://lean-lang.org/eval/problems/glauberman_zStar/)
  records the isolated-involution existence form; its hypotheses and
  conclusion agree with the public endpoint above.
- Axiom's [Z* assembly](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/LocalAnalysis/ZStar.lean),
  [Suzuki's Brauer–Suzuki proof](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/ThirdParty/QiuzhenCFSG/BenderSuzuki/External/Suzuki/VI/section_2_2/example_3.lean),
  [principal-block section constancy](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/LocalAnalysis/ZStar/ComponentFourierSpectral.lean),
  and [orthogonality contradiction](https://github.com/AxiomMath/CFSG/blob/69cb972f587a3ecc035e092253167ff2e303c962/CFSG/LocalAnalysis/ZStar/TwoAdicStepVII.lean)
  are secondary proof sources. They include Qiuzhen-CFSG material. Coordinate
  with the authors before adapting code; consolidate their character and core
  objects through the existing native APIs rather than copying parallel
  definitions. Some source assemblies import the finished odd-order theorem;
  those imports are not part of this roadmap's dependencies. Extract the
  general T.I./coherence inputs separately and audit the resulting import graph.
