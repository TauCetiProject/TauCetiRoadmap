# Roadmap: compactification and compactly supported étale cohomology

This roadmap builds the lower-shriek formalism needed for compactly supported étale cohomology of separated finite-type morphisms. It makes the compactification theorem and compactification-independence argument explicit, rather than treating “choose a compactification” as an invisible prerequisite.

The mathematical progression is

\[
\text{Nagata compactification}
\longrightarrow
j_!
\longrightarrow
f_!=\bar f_*j_!
\longrightarrow
Rf_!
\longrightarrow
R\Gamma_c
\longrightarrow
\text{localization, base change, finiteness, and Künneth}.
\]

Suggested code home:

```text
TauCeti/AlgebraicGeometry/EtaleCohomology/CompactSupport/
```

Suggested Lean namespaces for the Tau Ceti code — `TauCeti.AlgebraicGeometry` for the compactification geometry of Layers 0--2, `TauCeti.AlgebraicGeometry.EtaleCohomology` for the sheaf-theoretic Layers 3--10 (this roadmap's `Suggested.lean` uses `TauCetiRoadmap.CohomologicalPointCounting.CompactSupport`, per the family convention):

```text
TauCeti.AlgebraicGeometry
TauCeti.AlgebraicGeometry.EtaleCohomology
```

Direct roadmap dependencies:

```text
CohomologicalPointCounting/ConstructibleEtale
CohomologicalPointCounting/EtaleBaseChange
```

The Markdown roadmap is the definitive specification. `Suggested.lean` is nonexhaustive.

## Primary references and source-to-layer map

* The Stacks Project, compactification material in the schemes and morphisms chapters, including the Noetherian form of Nagata compactification.
* The Stacks Project, Chapter 59, §59.70, extension by zero on the étale site.
* The Stacks Project, Chapter 63, §§63.3 and 63.8--63.15, especially [derived lower shriek via compactifications](https://stacks.math.columbia.edu/tag/0F7H) and [compactly supported cohomology](https://stacks.math.columbia.edu/tag/0GJY).
* SGA 4, Exposé XVII, and SGA 4½, finiteness and compact supports.
* J. S. Milne, *Étale Cohomology*, Chapter VI.

| Roadmap material | Main source |
|---|---|
| Nagata compactification | Stacks, compactification chapters |
| Extension by zero | Stacks, §59.70 |
| Compactifications and lower shriek | Stacks, §§63.8--63.10 |
| Compactly supported cohomology | Stacks, §63.12 |
| Constructibility and finiteness | Stacks, §§63.13--63.15 |

## Standing conventions

### Geometric scope

The primary morphism is a separated finite-type morphism

\[
f:X\longrightarrow S
\]

between Noetherian schemes. This is the scope in which the roadmap constructs compactifications and \(Rf_!\). The `Compactification` and \(Rf_!\) definitions themselves are stated for this same class of morphisms — do not generalize the carriers ahead of the theorems — and every existence, constructibility, and finiteness theorem required for completion is stated in this Noetherian finite-type scope.

For compactly supported cohomology, the principal case is a separated finite-type scheme \(X\) over a field \(k\).

### Compactifications

A compactification of \(f\) is structured data

\[
X\xrightarrow{j}\bar X\xrightarrow{\bar f}S
\]

with \(j\) a quasi-compact open immersion, \(\bar f\) proper, and \(f=\bar f\circ j\). Define both `Compactification f` and the full subcategory `DenseCompactification f`; prove that replacing \(\bar X\) by the scheme-theoretic closure gives a functor to dense compactifications.

Compactifications are compared by morphisms over \(S\) restricting to the identity on \(X\). The common-refinement and cofilteredness APIs are part of the construction.

### Coefficients

Use the finite torsion and \(D^b_{\mathrm{ctf}}\) conventions of `ConstructibleEtale`. In every base-change, constructibility, finiteness, perfectness, projection-formula, and Künneth theorem, the annihilator \(N\) of the coefficient ring is assumed invertible on the base.

### Meaning of \(f_!\)

This roadmap concerns the lower shriek/direct image with proper support, not the exceptional inverse image \(f^!\). Names and namespaces must preserve that distinction.

## What Mathlib and Tau Ceti already have: consume

Consume:

* scheme morphisms, fibre products, graph morphisms, open and closed immersions;
* Mathlib morphism properties `IsSeparated`, `LocallyOfFiniteType`, `IsProper`, `QuasiCompact`, `QuasiSeparated`, `IsFinite`, and their base-change/composition APIs;
* Mathlib scheme-theoretic image, closure, blowup, strict-transform, and gluing infrastructure; build the missing lemmas named in Layer 1 in those existing namespaces;
* gluing of schemes and affine-local arguments;
* étale module sheaves, constructible sheaves, and `D^b_ctf` from `ConstructibleEtale`;
* direct image, proper base change, constructibility, and finiteness from `EtaleBaseChange`;
* generic derived-category, adjunction, triangulated-functor, and spectral-sequence infrastructure.

No existing Mathlib package supplies the Noetherian Nagata compactification theorem or the complete étale \(Rf_!\) formalism required here.

## What is missing: build here

The missing reusable library consists of:

1. a structured type/category of compactifications of a separated finite-type morphism;
2. the required Noetherian Nagata compactification theorem;
3. common refinements and compactification comparison;
4. extension by zero \(j_!\) for open immersions on module-valued étale sheaves;
5. exactness and constructibility of \(j_!\);
6. underived lower shriek \(f_!\) and independence of compactification;
7. derived lower shriek \(Rf_!\);
8. composition, proper agreement, base change, and projection formula;
9. open--closed localization triangles;
10. compactly supported cohomology \(R\Gamma_c\);
11. compact-support finiteness and perfectness;
12. compact-support external products and Künneth;
13. Galois and finite-group actions on lower-shriek and compact-support complexes.

## The build, in layers

### Layer 0: compactification objects

For a morphism \(f:X\to S\), define `Compactification f` containing:

* a scheme \(\bar X\);
* an open immersion \(j:X\to\bar X\);
* a proper morphism \(\bar f:\bar X\to S\);
* a proof \(f=\bar f\circ j\).

Define morphisms of compactifications and their composition. Build:

* forgetful maps to the factorization data;
* transport along isomorphisms of \(f\), \(X\), and \(S\);
* base change of compactifications;
* restriction over an open subscheme of \(S\);
* product compactifications;
* closure of the open image, producing a dense compactification;
* the category of compactifications of \(f\).

The type must carry enough structured data for functorial comparison. A bare existential theorem is not sufficient.

### Layer 1: Nagata compactification

Prove the Noetherian Nagata compactification theorem in the scope fixed above:

> Every separated finite-type morphism of Noetherian schemes admits a compactification by an open immersion followed by a proper morphism.

Pin the proof to the Noetherian route of Stacks, §38.33.

1. Develop quasi-compact-open-admissible blowups and strict transforms, including extension of an admissible blowup from a quasi-compact open and composition of admissible blowups.
2. Prove that two disjoint constructible closed subsets of a quasi-compact open acquire disjoint closures after an admissible blowup.
3. Prove the gluing lemma for two separated finite-type schemes sharing a dense quasi-compact open: after admissible blowups on both sides, they glue to a separated finite-type scheme over the base.
4. Prove that a compactification of a dense open \(V\subset U\) can, after an admissible blowup, be enlarged to an open carrying a proper extension to \(U\).
5. Prove the two-open induction step: if \(U=U_1\cup U_2\), the intersection is dense, and both \(U_i\) are compactifiable, then \(U\) is compactifiable.
6. Choose a finite affine open cover with dense total intersection. Compactify each affine by an immersion into affine space followed by scheme-theoretic closure in projective space, and iterate the two-open step.
7. Replace the result by the scheme-theoretic closure of \(X\) to obtain a dense compactification.

Every blowup, strict-transform, scheme-theoretic-image, separation, valuative-criterion, and gluing lemma used in these steps is either consumed from Mathlib or built explicitly in this layer.

### Layer 2: common refinements

Given two compactifications of the same \(f\), construct a third compactification mapping to both and restricting to the identity on \(X\). A standard construction uses the closure of the diagonal image of \(X\) in \(\bar X_1\times_S\bar X_2\).

Prove:

* existence of common refinements;
* compatibility of threefold refinements;
* connectedness/cofilteredness sufficient to prove independence of choices;
* base-change compatibility;
* identity and cocycle laws for the canonical comparison natural isomorphisms obtained from common refinements; define the compactification-independent functor from one chosen compactification together with these canonical independence isomorphisms, without quotienting the category of compactifications.

Package this once. Every downstream compactification-independent functor should consume the same comparison API.

### Layer 3: extension by zero along an open immersion

For an open immersion \(j:U\hookrightarrow X\), define

\[
j_!: \operatorname{Sh}(U_{\acute et},\Lambda)
\longrightarrow
\operatorname{Sh}(X_{\acute et},\Lambda).
\]

Build it at the sheaf level, not only as a derived object. Prove:

* the adjunction \(j_!\dashv j^*\);
* exactness of \(j_!\);
* full faithfulness;
* \(j^*j_!\simeq\operatorname{id}\);
* stalk formula: the original stalk on \(U\), zero outside \(U\);
* compatibility with composition of open immersions;
* compatibility with base change;
* compatibility with tensor products and coefficient change;
* if \(X\) is locally Noetherian and \(j\) is quasi-compact, preservation of a finite lisse sheaf on \(U\) as a constructible sheaf on \(X\);
* the open--closed short exact sequence at the abelian level.

Do not use the topological-space extension-by-zero functor as a substitute without proving it agrees with the étale construction.

### Layer 4: underived lower shriek

For a compactification \(X\xrightarrow j\bar X\xrightarrow{\bar f}S\), define the candidate

\[
f_!^{(j,\bar f)}=\bar f_*j_!.
\]

Use common refinements and proper base change to construct canonical natural isomorphisms between the candidates attached to two compactifications. Prove cocycle coherence.

Define compactification-independent

\[
f_!: \operatorname{Sh}(X_{\acute et},\Lambda)
\longrightarrow
\operatorname{Sh}(S_{\acute et},\Lambda)
\]

and prove:

* agreement with \(f_*\) for proper \(f\);
* agreement with \(j_!\) for an open immersion;
* composition \((g\circ f)_!\simeq g_!f_!\);
* base change;
* stalk description by sections with proper support over a geometric point.

### Layer 5: derived lower shriek

Construct

\[
Rf_!:D^+(X_{\acute et},\Lambda)\to D^+(S_{\acute et},\Lambda)
\]

and prove that it restricts to a functor on \(D^b_{\mathrm{ctf}}\) in the geometric and coefficient scope fixed above.

The definition is \(Rf_!:=R\bar f_*\circ j_!\) for a chosen compactification, using exactness of \(j_!\), following the Stacks Project. \(Rf_!\) is **not** the right derived functor of the underived \(f_!\) of Layer 4 — \(j_!\) does not send injectives to \(\bar f_*\)-acyclic sheaves, and compactly supported cohomology is not a derived functor of sections with proper support. Construct the canonical transformation from the right derived functor of \(f_!\) to \(Rf_!\), record that it is generally not an isomorphism, and prove the degree-zero agreement \(\mathcal H^0(Rf_!K)\cong f_!\mathcal H^0(K)\) for \(K\) concentrated in degree zero.

Build:

* independence of compactification at the derived level;
* composition;
* proper agreement \(Rf_!\simeq Rf_*\);
* open-immersion agreement \(Rj_!\simeq j_!\);
* base-change transformation and theorem;
* compatibility with shifts, triangles, coefficient change, and finite group actions.

### Layer 6: localization

For a complementary open--closed pair

\[
j:U\hookrightarrow X,
\qquad i:Z\hookrightarrow X,
\]

construct the distinguished triangles

\[
j_!j^*K\longrightarrow K\longrightarrow i_*i^*K
\longrightarrow (j_!j^*K)[1]
\]

and the compact-support cohomology triangle obtained by applying \(Rf_!\).

Prove naturality of the displayed localization triangle, compatibility with refinement of opens, finite group actions, cup products, and base change.

This layer must include Mayer--Vietoris for a finite open cover as a consequence.

### Layer 7: compactly supported cohomology

For separated finite-type \(X/k\) with structure morphism \(f\), define

\[
R\Gamma_c(X,K)=R\Gamma(\operatorname{Spec}k,Rf_!K)
\]

and

\[
H^i_c(X,K)=H^i(R\Gamma_c(X,K)).
\]

Build:

* long exact localization sequences;
* proper comparison \(R\Gamma_c\simeq R\Gamma\);
* base change to field extensions;
* Galois actions after base change to a separable closure;
* functoriality obtained from composition of lower-shriek functors and from specified morphisms of coefficient complexes;
* compatibility with coefficient change and Tate twists;
* finite group actions.

### Layer 8: constructibility, boundedness, finiteness, and perfectness

For \(f:X\to S\) separated finite type and

\[
K\in D^b_{\mathrm{ctf}}(X,\Lambda),
\]

prove that \(Rf_!K\in D^b_{\mathrm{ctf}}(S,\Lambda)\), assuming the annihilator of \(\Lambda\) is invertible on \(S\).

For \(X\) over a separably closed field, prove:

* \(H^i_c(X,K)\) is finite over \(\Lambda\);
* vanishing outside a finite range;
* \(R\Gamma_c(X,K)\) is a perfect \(\Lambda\)-complex — finite Tor dimension of \(K\) is already part of the ctf hypothesis.

Perfectness is a load-bearing target for the finite-coefficient trace formula. It must be stated in the exact category consumed by `TraceFormula`.

### Layer 9: projection formula and Künneth with compact support

Prove the projection formula

\[
Rf_!(K\otimes^L f^*L)
\simeq
Rf_!K\otimes^L L
\]

for \(K\in D^b_{\mathrm{ctf}}(X,\Lambda)\) and \(L\in D^b_{\mathrm{ctf}}(S,\Lambda)\).

For separated finite-type schemes \(X,Y\) over a separably closed field, prove

\[
R\Gamma_c(X,K)\otimes^L_\Lambda R\Gamma_c(Y,L)
\xrightarrow{\sim}
R\Gamma_c(X\times Y,K\boxtimes L).
\]

Build associativity, symmetry, cup/external products, and equivariance under arbitrary morphisms of the base-change data and under finite group actions — the Frobenius specialization is made downstream by `TraceFormula` using `FrobeniusGeometry`. Reuse the external-product API from `EtaleBaseChange`.

### Layer 10: structural calculations

Develop the compact-support calculations that follow from this roadmap's own functorial machinery, without importing purity or Poincaré duality:

* a point and a finite étale scheme;
* the compactification of \(\mathbf A^1\) by \(\mathbf P^1\);
* the localization triangle for \(\mathbf G_m\subset\mathbf A^1\);
* the product compactification of \(\mathbf A^n\) and the associated Künneth comparison;
* proper schemes, for which compact support agrees with ordinary cohomology.

This layer constructs the canonical triangles and comparison morphisms but does not assert the exact Tate-twist description of \(R\Gamma_c(\mathbf A^n,\Lambda)\). The bounded calculation of projective space and the consequent exact descriptions for affine space and \(\mathbf G_m\) are owned by `TraceFormula`, using finite-level Artin comparison, Kummer classes, localization, and Künneth. Purity and Poincaré duality remain outside this roadmap family.

**Summit:** \(Rf_!\) is compactification-independent, base-change compatible, constructibility preserving, and yields perfect compactly supported cohomology for ctf coefficients.

## Worked examples and acceptance criteria

1. For proper \(X/k\), `RΓc X K` is canonically equivalent to ordinary `RΓ X K`.
2. For an open immersion, the compactification definition of lower shriek agrees with extension by zero.
3. Two explicit compactifications of \(\mathbf A^1\) give the same \(R\Gamma_c\).
4. The open--closed triangle for \(\mathbf G_m\subset\mathbf A^1\) is functorial and yields its long exact compact-support sequence.
5. Compact support commutes with extension of separably closed base fields.
6. Product compactifications induce the compact-support Künneth isomorphism.
7. A finite group action on \(X\) induces an action on \(R\Gamma_c(X,K)\) compatible with localization.

A layer is not complete if compactification independence is only propositional existence. The canonical comparison isomorphisms and their cocycle coherence must be available.

## Design notes for Lean

### Avoid quotienting compactifications prematurely

Use a category of compactifications and canonical comparison isomorphisms. A quotient type erases the morphisms needed to prove functoriality and composition.

### Make compactification independence a reusable pattern

The same cofiltered-choice argument may be useful elsewhere. Isolate categorical lemmas for defining a functor from a connected/cofiltered diagram of canonically isomorphic candidates.

### Use the existing derived direct image

`Rf_!` is built from `R\bar f_*` and exact `j_!`; do not create a second derived-direct-image implementation.

### Keep lower and upper shriek names distinct

This roadmap does not define exceptional inverse image. Avoid a namespace in which `shriek` could refer to either direction.

## Scope boundaries

The following are not targets of this roadmap:

* constructible coefficients, owned by `ConstructibleEtale`;
* proper base change for \(Rf_*\), owned by `EtaleBaseChange`;
* topological compact support and Artin comparison, owned by `ComplexComparison`;
* \(\ell\)-adic inverse limits, owned by `EllAdicRealization`;
* Grothendieck--Lefschetz, owned by `TraceFormula`;
* \(f^!\), Verdier duality, nearby cycles, or a complete six-functor package;
* purity and weights.

## Completion criterion

This roadmap is complete when:

* the stated form of Nagata compactification is proved and represented by a usable structured API;
* compactifications admit coherent common refinements;
* extension by zero for open immersions is exact, stalkwise characterized, base-change compatible, and constructibility preserving;
* underived and derived lower shriek are compactification independent and functorial;
* \(Rf_!\) satisfies composition, proper agreement, base change, projection formula, and localization;
* \(R\Gamma_c\) has finite, bounded, perfect output for the pinned ctf coefficients;
* compact-support Künneth and group-action compatibility are proved;
* the worked examples pass;
* the Tau Ceti implementation contains no `sorry`.
